<hr>
<form action="" method="post" enctype="multipart/form-data">
Provide new image for:

<!--- DROPDOWN LIST OF USERS --->
<select name="contactid">
<cfoutput query="get_users">
<option value="#contactid#">#firstname# #lastname#</option>
</cfoutput>
</select>

<!--- FILE UPLOAD UI --->
<input type="file" name="fileToUpload">

<!--- SUBMIT BUTTON --->
<button type="submit">Upload</button>
</form>
<hr>
