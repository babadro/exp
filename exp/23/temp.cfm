<cfdump var="#session.urltoken#">
<cfdump var="#URL#">
<cfinclude template="VarPassingFunctions.cfm">

<cfoutput>#structKeyList(FORM)#<br></cfoutput>
<cfoutput>#FORM.fieldnames#</cfoutput>

