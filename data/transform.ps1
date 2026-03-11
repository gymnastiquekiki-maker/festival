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
$settings.Encoding = New-Object System.Text.UTF8Encoding($false)
$settings.OmitXmlDeclaration = $true
$settings.Indent = $false
$settings.ConformanceLevel = [System.Xml.ConformanceLevel]::Fragment

foreach ($xsltName in $map.Keys) {
  $xsltPath = Join-Path $xsltDir $xsltName
  $outPath = Join-Path $outDir $map[$xsltName]

  $transform = New-Object System.Xml.Xsl.XslCompiledTransform
  $transform.Load($xsltPath)

  $writer = [System.Xml.XmlWriter]::Create($outPath, $settings)
  $transform.Transform($xmlPath, $null, $writer)
  $writer.Close()
}
