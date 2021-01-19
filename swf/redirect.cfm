<cfset targetURL = getHTTPRequestData().content>
<cfset XmlUrl = XmlParse(targetURL)>
<cfset TargetUrl = XmlUrl.location.XmlAttributes.url>
<cflocation url="#TargetUrl#">
