<cfset newXML = XMLParse(getHTTPRequestData().content)>
<cflocation url="#newXML.redirect.XmlAttributes.url#">