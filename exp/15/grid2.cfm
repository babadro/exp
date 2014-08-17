<cfinvoke component="movies" method="list" returnvariable="movies">

<cfinclude template="header.cfm">

<cfform>
	<cfgrid name="movieGrid" width="800" format="html" query="movies">
		<cfgridcolumn name="FilmID" display="no">
		<cfgridcolumn name="MovieTitle" header="Title" width="200">
		<cfgridcolumn name="Rating" width="100">
		<cfgridcolumn name="Summary" header="Summary" width="400">
	</cfgrid>
</cfform>

<cfinclude template="footer.cfm">