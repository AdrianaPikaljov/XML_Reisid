<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="xml" indent="yes"/>
	<!--parameetri määramine-->
	<xsl:param name="kallis">800</xsl:param>

	<xsl:template match="/">

		<strong>Lennureisid</strong>

		<!-- 6. filter: ainult lennuga reisid; 7. sorteerimine paevade järgi -->
		<xsl:for-each select="//reis[transport/liik='Lennuk']">
		<xsl:sort select="kestus/paevad" data-type="number" order="descending"/>

			<!-- 1. sihtkoht pealkirjana -->
			<h1>
				<xsl:value-of select="concat(sihtkoht/linn, ', ', sihtkoht/riik)"/>
			</h1>

			<!-- 2. täpploetelu -->
			<ul>
				<!-- 3. kolmanda taseme andmed kollasel taustal -->
				<li>
					<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					Sihtkoht: <xsl:value-of select="sihtkoht/linn"/>, <xsl:value-of select="sihtkoht/riik"/>
				</li>
				<li>
					<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					Transport: <xsl:value-of select="transport/liik"/>
				</li>
				<li>
					<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					Kestus: <xsl:value-of select="kestus/paevad"/> päeva
				</li>
				<li>
					<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					Hind: <xsl:value-of select="hind/euro"/> €
				</li>
			</ul>


			<!-- 4. oma tingimus: kallis reis esile tõstetud -->
			<xsl:if test="hind/euro >= $kallis">
				<span style="color: red; font-weight: bold;">
					Kallis reis! (hind alates <xsl:value-of select="$kallis"/> €)
				</span>
			</xsl:if>
			<!-- soodsad reisid -->
			<xsl:if test="400 > hind/euro">
				<span style="color: green; font-weight: bold;">
					Soodne reis!
				</span>
			</xsl:if>
			<hr></hr>
		</xsl:for-each>

		<!-- 5. kogumaksumuss -->
		<strong>
			Kogumaksumus:
			<xsl:value-of select="sum(//euro)"/> €
		</strong>
		<br></br>

		<!-- 8. kõik andmed tabelina, read vahelduva värviga -->
		<strong>Kõik reisid tabelina</strong>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Linn</th>
				<th>Riik</th>
				<th>Transport</th>
				<th>Kestus (p)</th>
				<th>Hind (€)</th>
			</tr>
			<xsl:for-each select="//reis">
				<tr>
					<xsl:if test="position() mod 2 = 1">
						<xsl:attribute name="style">background-color: pink;</xsl:attribute>
					</xsl:if>
					<xsl:if test="position() mod 2 = 0">
						<xsl:attribute name="style">background-color: deepskyblue;</xsl:attribute>
					</xsl:if>
					<td>
						<xsl:value-of select="@id"/>
					</td>
					<td>
						<xsl:value-of select="sihtkoht/linn"/>
					</td>
					<td>
						<xsl:value-of select="sihtkoht/riik"/>
					</td>
					<td>
						<xsl:value-of select="transport/liik"/>
					</td>
					<td>
						<xsl:value-of select="kestus/paevad"/>
					</td>
					<td>
						<xsl:value-of select="hind/euro"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>
</xsl:stylesheet>