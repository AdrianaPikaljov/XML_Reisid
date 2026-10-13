<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>
	<!--parameetri määramine-->
	<xsl:param name="otsing">a</xsl:param>
	<xsl:param name="pikkus">5</xsl:param>
    <xsl:template match="/">
		<strong>Kõik sugupuu nimed</strong>
		<ul>
			<xsl:for-each select="//inimene">
				<li>
					<xsl:value-of select="nimi"/>, 
					<xsl:value-of select="@synd"/>:
					<xsl:value-of select="concat(nimi, ' sünniaasta: ', @synd)"/>
					. Vanus - 
					<xsl:value-of select="2026-@synd"/> aastat vana
				</li>
			</xsl:for-each>
		</ul>
		<ol>
			<li> 1. täht kõikidest nimedest: 
			<xsl:for-each select="//inimene">
				<xsl:value-of select="substring(nimi, 1, 1)"/>,
			</xsl:for-each>
			</li>
			<li>
				Näita nimed ja tähtede kogused:
				<xsl:for-each select="//inimene">
					<xsl:value-of select="concat(nimi, ': ', string-length(nimi), ' tähte ')"/>,
				</xsl:for-each>
			</li>
		</ol>
		
		
		<strong>Näita kõik nimed mis algavd C-tähega: </strong>
		<xsl:for-each select="//inimene[starts-with(nimi, 'C')]">
			<xsl:value-of select="nimi"/>, 
		</xsl:for-each>
		<br></br>
		<strong>Parameetrite kasutamine</strong>
		<br></br>
		Otsime nimed mis siseldavad parameet otsing=
		<xsl:value-of select="$otsing"/>
		<br></br>
		<xsl:for-each select="//inimene[contains(nimi, $otsing)]">
			<xsl:value-of select="nimi"/>, 
		</xsl:for-each>
		<br></br>
		Otsime nimed mis pikkusega=
		<xsl:value-of select="$pikkus"/> ja rohkem
		<br></br>
		<xsl:for-each select="//inimene[string-length(nimi)>=$pikkus]">
			<xsl:value-of select="concat(nimi, ' - pikkus: ', string-length(nimi))"/>,
		</xsl:for-each>
		<br></br>
		Kasutame if lause:
		Iga inimese kohta näitame mitmendal oma vanema sünniaastal ta sündis
		<ul>
			<xsl:for-each select="//inimene">
				<li>
					<xsl:value-of select="nimi"/>
					<xsl:if test="../..">
						 - vanema vanus oli - 
						 <xsl:value-of select="../../@synd -@synd"/> aastat vana
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>

		<strong>Värvime nimed pikkusega rohkem kui 7</strong>
		<table border ="1">
			<tr>
				<th>Nimi</th>
				<th>Aasta</th>
				<th>Vanus</th>
				<th>1 täht</th>
				<th>Viimane täht</th>
			</tr>
			<xsl:for-each select="//inimene">
			<tr>
				<td>
					<xsl:if test="string-length(nimi)>7">
						<xsl:attribute name="style">
							background-color: green;
						</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="nimi"/>
				</td>
				<td>
					<xsl:value-of select="@synd"/>
				</td>
				<td>
					<xsl:value-of select="2026-@synd"/>
				</td>
				<td>
					<xsl:value-of select="substring(nimi, 1, 1)"/>
				</td>
				<td>
					<xsl:value-of select="substring(nimi, string-length(nimi), 1)"/>
				</td>
			</tr>
			</xsl:for-each>
		</table>
    </xsl:template>
</xsl:stylesheet>
