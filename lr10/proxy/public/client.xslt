<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html lang="en">
        <head>
            <title>Client XSLT</title>
        </head>
        <body>
            <xsl:if test="//error">
                <h1>
                    <xsl:value-of select="//error"></xsl:value-of>
                </h1>
            </xsl:if>

            <xsl:if test="//query">
                <p>
                    Было: <xsl:value-of select="//query"></xsl:value-of>
                </p>
            </xsl:if>

            <xsl:if test="//result">
                <p>
                    Стало: <xsl:value-of select="//result"></xsl:value-of>
                </p>
            </xsl:if>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>