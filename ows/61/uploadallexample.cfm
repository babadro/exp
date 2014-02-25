<cfif structKeyExists(form, "upload")>
    <cffile action="uploadAll" destination="#expandPath('./')#" result="result">
	<cfdump var="#result#">
</cfif>

<form enctype="multipart/form-data" method="post">
<!--- create 5 upload fields --->
<cfloop index="x" from="1" to="5">
    <cfoutput>
	File #x#: <input type="file" name="fileupload#x#"><br/>
	</cfoutput>
</cfloop>
<input type="submit" name="upload" value="Upload a bunch of stuff!">
</form>            