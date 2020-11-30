<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">

    <html>

      <head>

        <title>Ответ</title>

      </head>

      <body>


        <xsl:if test="count(arrays/array)=0">
          <p><xsl:value-of select="hash/message/text()"/></p>
        </xsl:if>

        <xsl:if test="count(arrays/array)>0">
        <table>

          <thead>

            <tr>

              <th>#</th>
              <th>Первое число</th>
              <th>Второе число</th>

            </tr>

          </thead>

          <xsl:for-each select="arrays/array">

            <xsl:variable name="counter" select="position()"/>

            <tbody>

              <tr>

                <th>
                  <xsl:value-of select="$counter"/>
                </th>
                <th>
                  <xsl:value-of select="array[1]/text()"/>
                </th>
                <th>
                  <xsl:value-of select="array[2]/text()"/>
                </th>

              </tr>

            </tbody>

          </xsl:for-each>

        </table>
        </xsl:if>

      </body>

    </html>

  </xsl:template>

</xsl:stylesheet>