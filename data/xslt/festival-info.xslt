<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/festival/info">{
  "name": "<xsl:value-of select="name"/>",
  "edition": <xsl:value-of select="edition"/>,
  "location": "<xsl:value-of select="location"/>",
  "start_date": "<xsl:value-of select="start_date"/>",
  "end_date": "<xsl:value-of select="end_date"/>"
}</xsl:template>
</xsl:stylesheet>
