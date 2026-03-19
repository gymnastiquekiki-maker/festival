<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/festival/events"/>
  </xsl:template>
  <xsl:template match="/festival/events">{
  "items": [
<xsl:for-each select='event'>    {
    "id": "<xsl:value-of select='@id'/>",
    "venue_id": "<xsl:value-of select='@venue_id'/>",
    "performer_id": "<xsl:value-of select='@performer_id'/>",
    "date": "<xsl:value-of select='@date'/>",
    "time": "<xsl:value-of select='@time'/>"
  }<xsl:if test='position() != last()'>,</xsl:if>
</xsl:for-each>
  ],
  "page": 1,
  "pageSize": <xsl:value-of select='count(event)'/>,
  "totalItems": <xsl:value-of select='count(event)'/>,
  "totalPages": 1,
  "filters": {
    "day": null,
    "venueId": null,
    "performerId": null
  }
}</xsl:template>
</xsl:stylesheet>
