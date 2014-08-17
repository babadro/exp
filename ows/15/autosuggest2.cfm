<cfinclude template="header.cfm">

<cfform>
	<table align="center" bgcolor="orange">
		<tr><th colspan="2"><font size="+1">Find a Movie</font></th></tr>
		<tr><td>MOvie:</td></tr>
		<cfinput type="Text" name="MovieTitel" autosuggest="cfc:movies.lookupMovie(cfautosuggestvalue)" size="50" maxlength="100">
	</table>
</cfform>