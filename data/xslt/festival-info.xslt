<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/festival/info"/>
  </xsl:template>
  <xsl:template match="/festival/info">{
  "name": "<xsl:value-of select='name'/>",
  "edition": <xsl:value-of select='edition'/>,
  "location": "<xsl:value-of select='location'/>",
  "description": "<xsl:value-of select='description'/>",
  "start_date": "<xsl:value-of select='start_date'/>",
  "end_date": "<xsl:value-of select='end_date'/>",
  "tickets": [
<xsl:for-each select='tickets/ticket'>    {
      "code": "<xsl:value-of select='@code'/>",
      "name": "<xsl:value-of select='@name'/>",
      "price_czk": <xsl:value-of select='@price_czk'/>,
      "description": "<xsl:value-of select='normalize-space(.)'/>"
    }<xsl:if test='position() != last()'>,</xsl:if>
</xsl:for-each>
  ],
  "links": {
<xsl:for-each select='links/link'>    "<xsl:value-of select='@rel'/>": "<xsl:value-of select='normalize-space(.)'/>"<xsl:if test='position() != last()'>,</xsl:if>
</xsl:for-each>
  }
}</xsl:template>
</xsl:stylesheet>
