<cfif CGI.CONTENT_LENGTH gt 0>
	<cfset content = getHTTPRequestData().content>
	<cfset myXML = XMLParse(content)>
	<cfset name = myXML.feedback.name.XmlText>
	<cfset comments = myXML.feedback.comments.XmlText>
	
	<cfquery name="Feedback_Insert" datasource="Guestbook">
		insert into Feedback (Name, Comments)
		values ('#name#', '#comments#')
	</cfquery>
</cfif>

<cfquery name="Feedback_Select" datasource="Guestbook">
	select top 50 *
	from Feedback
	order by FeedbackDateTime DESC
</cfquery>

<cfoutput>
<table>
<cfloop query="Feedback_Select">
<tr>
<td>#Name# (#DateFormat(FeedbackDateTime, "mmm d, yyyy")# #TimeFormat(FeedbackDateTime, "h:mm tt")#)</td>
</tr>
<tr>
<td>#ParagraphFormat(Comments)#</td>
</tr>
<tr>
<td><hr></td>
</tr>
</cfloop>
</table>
</cfoutput>

<cfsetting showdebugoutput="No">
