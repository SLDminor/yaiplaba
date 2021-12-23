<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="//error">
        <h1>
            <xsl:value-of select="//error"></xsl:value-of>
        </h1>
    </xsl:template>

    <xsl:template match="//query">
        <p>
            Было: <xsl:value-of select="//query"></xsl:value-of>
        </p>
    </xsl:template>

    <xsl:template match="//result">
        <p>
            Стало: <xsl:value-of select="//result"></xsl:value-of>
        </p>
    </xsl:template>
</xsl:stylesheet>