param(
  [string]$Root = (Split-Path -Parent $MyInvocation.MyCommand.Path)
)

$xmlPath = Join-Path $Root "festival.xml"
$xsltDir = Join-Path $Root "xslt"
$outDir = Join-Path $Root "json"

New-Item -ItemType Directory -Path $outDir -Force | Out-Null

$map = @{
  "festival-info.xslt" = "info.json"
  "festival-venues.xslt" = "venues.json"
  "festival-performers.xslt" = "performers.json"
  "festival-events.xslt" = "events.json"
}

$settings = New-Object System.Xml.XmlWriterSettings
$settings.OmitXmlDeclaration = $true
$settings.Indent = $false
$settings.ConformanceLevel = [System.Xml.ConformanceLevel]::Fragment
$utf8Bom = New-Object System.Text.UTF8Encoding($true)

foreach ($xsltName in $map.Keys) {
  $xsltPath = Join-Path $xsltDir $xsltName
  $outPath = Join-Path $outDir $map[$xsltName]

  $transform = New-Object System.Xml.Xsl.XslCompiledTransform
  $transform.Load($xsltPath)

  $stringWriter = New-Object System.IO.StringWriter
  $writer = [System.Xml.XmlWriter]::Create($stringWriter, $settings)
  $transform.Transform($xmlPath, $null, $writer)
  $writer.Close()
  [System.IO.File]::WriteAllText($outPath, $stringWriter.ToString(), $utf8Bom)
}
