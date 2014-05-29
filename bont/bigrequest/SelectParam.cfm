<cfquery name="getBrand" datasource="bont" >SELECT * FROM brand</cfquery>
<cfform style="float:left" action="#CGI.script_name#" method="post" >
	<table align="left">
		<tr><td>Бренд</td><td><cfselect name="brand" query="getBrand" display="name_eng" value="name_eng"/></td></tr>
		
		<tr><td><input type="submit" value="сделать выборку"></td></tr>
	</table>
</cfform>
<cfform style="float:left" action="#CGI.script_name#" method="post" >
	<table align="left">
		<tr><td>Бренд</td><td><cfselect name="brand2" query="getBrand" display="name_eng" value="name_eng"/></td></tr>
		
		<tr><td><input type="submit" value="сделать выборку"></td></tr>
	</table>
</cfform>
<cfif isDefined("FORM.brand")><cfoutput>#FORM.brand#</cfoutput></cfif>
<cfif isDefined("FORM.brand2")><cfoutput>#FORM.brand2#</cfoutput></cfif>