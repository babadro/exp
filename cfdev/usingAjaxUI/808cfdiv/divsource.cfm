<h3>Echoing main page input:</h3>
<cfoutput>
<cfif isdefined("url.InputText")>
#url.InputText#
<cfelse>
No input
</cfif>
</cfoutput>