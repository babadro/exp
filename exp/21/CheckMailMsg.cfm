
<html>
<head><title>Mail Message</title></head>
<body>

<!--- Simple CSS-based formatting styles --->
<style>
 body { font-family:sans-serif;font-size:12px} 
 th { font-size:12px;background:navy;color:white} 
 td { font-size:12px;background:lightgrey;color:navy} 
</style>

<h2>Mail Message</h2>

<cfparam name="URL.uid">
<cfparam name="URL.delete" type="boolean" default="no">

<cfset attachDir = expandPath("Attach")>
<cfset TAB = chr(9)>

<cfif not directoryExists(attachDir)>
	<cfdirectory action="create" directory="#attachDir#">
</cfif>

</body>
</html>