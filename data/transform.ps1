param(
  [string]$Root = (Split-Path -Parent $MyInvocation.MyCommand.Path)
)

$xmlPath = Join-Path $Root "festival.xml"
$xsltDir = Join-Path $Root "transformation"
$outDir = Join-Path $Root "json"

New-Item -ItemType Directory -Path $outDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $outDir "venues") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $outDir "performers") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $outDir "events") -Force | Out-Null

$map = @{
  "festival-info.xslt" = "festival.json"
  "festival-venues.xslt" = "venues.json"
  "festival-performers.xslt" = "performers.json"
  "festival-events.xslt" = "events.json"
}

$settings = New-Object System.Xml.XmlWriterSettings
$settings.OmitXmlDeclaration = $true
$settings.Indent = $false
$settings.ConformanceLevel = [System.Xml.ConformanceLevel]::Fragment
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Invoke-XsltTransform {
  param(
    [string]$XsltPath,
    [string]$OutPath,
    [hashtable]$Parameters = @{}
  )
  $transform = New-Object System.Xml.Xsl.XslCompiledTransform
  $transform.Load($XsltPath)

  $arguments = New-Object System.Xml.Xsl.XsltArgumentList
  foreach ($key in $Parameters.Keys) {
    $arguments.AddParam($key, "", $Parameters[$key])
  }

  $stringWriter = New-Object System.IO.StringWriter
  $writer = [System.Xml.XmlWriter]::Create($stringWriter, $settings)
  $transform.Transform($xmlPath, $arguments, $writer)
  $writer.Close()
  [System.IO.File]::WriteAllText($OutPath, $stringWriter.ToString(), $utf8NoBom)
}

foreach ($xsltName in $map.Keys) {
  $xsltPath = Join-Path $xsltDir $xsltName
  $outPath = Join-Path $outDir $map[$xsltName]
  Invoke-XsltTransform -XsltPath $xsltPath -OutPath $outPath
}

$legacyInfoPath = Join-Path $outDir "info.json"
if (Test-Path $legacyInfoPath) {
  Remove-Item $legacyInfoPath -Force
}

[xml]$xml = Get-Content -Raw -Path $xmlPath

$venueXslt = Join-Path $xsltDir "festival-venue-detail.xslt"
foreach ($venue in $xml.festival.venues.venue) {
  $outPath = Join-Path $outDir ("venues/{0}.json" -f $venue.id)
  Invoke-XsltTransform -XsltPath $venueXslt -OutPath $outPath -Parameters @{ id = $venue.id }
}

$performerXslt = Join-Path $xsltDir "festival-performer-detail.xslt"
foreach ($performer in $xml.festival.performers.performer) {
  $outPath = Join-Path $outDir ("performers/{0}.json" -f $performer.id)
  Invoke-XsltTransform -XsltPath $performerXslt -OutPath $outPath -Parameters @{ id = $performer.id }
}

$eventXslt = Join-Path $xsltDir "festival-event-detail.xslt"
foreach ($event in $xml.festival.events.event) {
  $outPath = Join-Path $outDir ("events/{0}.json" -f $event.id)
  Invoke-XsltTransform -XsltPath $eventXslt -OutPath $outPath -Parameters @{ id = $event.id }
}
