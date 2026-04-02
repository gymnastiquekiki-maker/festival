<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/festival/venues"/>
  </xsl:template>
  <xsl:template match="/festival/venues">[
<xsl:for-each select='venue'>  {
    "id": "<xsl:value-of select='@id'/>",
    "name": "<xsl:value-of select='normalize-space(.)'/>"
  }<xsl:if test='position() != last()'>,</xsl:if>
</xsl:for-each>
]</xsl:template>
</xsl:stylesheet>
