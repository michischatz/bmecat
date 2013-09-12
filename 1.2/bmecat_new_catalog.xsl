<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
    Document   : bmecat_new_catalog_1_2.xsl
    Created on : 12. September 2013, 10:55
    Author     : Michael Schatz
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>bmecat_new_catalog_1_2.xsl</title>
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="HEADER">
        <h1>HEADER</h1>
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="GENERATOR_INFO">
        <h2>GENERATOR_INFO</h2>
        <p><xsl:value-of select="." /></p>
    </xsl:template>
    <xsl:template match="CATALOG">
        <h2>CATALOG</h2>
        <table>
            <xsl:apply-templates />
        </table>
    </xsl:template>
    <xsl:template match="LANGUAGE">
        <tr>
            <td>LANGUAGE</td>
            <td><xsl:value-of select="." /></td>
        </tr>
    </xsl:template>
    <xsl:template match="CATALOG_ID">
        <tr>
            <td>CATALOG_ID</td>
            <td><xsl:value-of select="." /></td>
        </tr>
    </xsl:template>
    <xsl:template match="CATALOG_VERSION">
        <tr>
            <td>CATALOG_VERSION</td>
            <td><xsl:value-of select="." /></td>
        </tr>
    </xsl:template>
    <xsl:template match="CATALOG_NAME">
        <tr>
            <td>CATALOG_NAME</td>
            <td><xsl:value-of select="." /></td>
        </tr>
    </xsl:template>
    <xsl:template match="DATETIME">
        <tr>
            <td>DATETIME</td>
            <td><xsl:value-of select="." /> (<xsl:value-of select="@type" />)</td>
        </tr>
    </xsl:template>
    <xsl:template match="SUPPLIER">
        <h2>SUPPLIER</h2>
        <p><xsl:value-of select="." /></p>
    </xsl:template>
    <xsl:template match="T_NEW_CATALOG">
        <h1>T_NEW_CATALOG</h1>
        <xsl:for-each select="ARTICLE">
            <xsl:choose>
                <xsl:when test="@mode='new'"><hr /></xsl:when>
                <xsl:otherwise><h2>FEHLER</h2></xsl:otherwise>
            </xsl:choose>
            <table>
                <tr>
                    <td>SUPPLIER_AID</td>
                    <td><xsl:value-of select="SUPPLIER_AID" /></td>
                </tr>
                <tr>
                    <td>DESCRIPTION_SHORT</td>
                    <td><xsl:value-of select="ARTICLE_DETAILS/DESCRIPTION_SHORT" /></td>
                </tr>
                <tr>
                    <td>DESCRIPTION_LONG</td>
                    <td><xsl:value-of select="ARTICLE_DETAILS/DESCRIPTION_LONG" /></td>
                </tr>
                <tr>
                    <td>EAN</td>
                    <td><xsl:value-of select="ARTICLE_DETAILS/EAN" /></td>
                </tr>
                <tr>
                    <td>MANUFACTURER_AID</td>
                    <td><xsl:value-of select="ARTICLE_DETAILS/MANUFACTURER_AID" /></td>
                </tr>
                <tr>
                    <td>MANUFACTURER_NAME</td>
                    <td><xsl:value-of select="ARTICLE_DETAILS/MANUFACTURER_NAME" /></td>
                </tr>
            </table>
            <xsl:for-each select="ARTICLE_FEATURES">
                <h3><xsl:value-of select="REFERENCE_FEATURE_SYSTEM_NAME" /></h3>
                <dl>
                    <dt>REFERENCE_FEATURE_GROUP_ID</dt>
                    <dd><xsl:value-of select="REFERENCE_FEATURE_GROUP_ID" /></dd>
                </dl>
                <table>
                    <thead>
                        <th>FNAME</th>
                        <th>FVALUE</th>
                        <th>FORDER</th>
                    </thead>
                    <tbod>
                        <xsl:for-each select="FEATURE">
                            <tr>
                                <td><xsl:value-of select="FNAME" /></td>
                                <td><xsl:value-of select="FVALUE" /></td>
                                <td><xsl:value-of select="FORDER" /></td>
                            </tr>
                        </xsl:for-each>
                    </tbod>
                </table>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
