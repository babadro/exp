<cfset imageDirPath = ExpandPath("user_photos")>

<cfquery name="get_users" datasource="ows">
	SELECT * 
	FROM Contacts
	ORDER BY lastname, firstname
</cfquery>


<cfif isDefined("form.fileToUpload") and form.fileToUpload neq "">
	<cfset userPhotoPath = "#imageDirPath#/user_#form.contactid#.jpg">
	<cfset userThumbPath = "#imageDirPath#/user_#form.contactid#_thumb.jpg">

    <cfif not directoryExists(imageDirPath)>
       <cfdirectory action="create" directory="#imageDirPath#">
    </cfif>
	
	<!--- Accept the file upload --->
	<cffile 
	    action="upload"
	    destination="#getTempDirectory()#"
	    fileField="fileToUpload"
	    nameConflict="overwrite">

	<!--- Get info about the photo --->
	<cfimage
		action="info"
		source="#cffile.serverDirectory#/#cffile.serverFile#"
		structName="uploadedFileInfo">

	<cfif uploadedFileInfo.width lt 100 
	   or uploadedFileInfo.height lt 100
	   or uploadedFileInfo.width gt 1000
	   or uploadedFileInfo.height gt 1000>
		<cfthrow message="Please provide an image between 100 and 1000 pixels tall and wide.">
	</cfif>

	<!--- Convert the photo and write it to a variable--->
	
	<cfimage
		action="convert"
		source="#cffile.serverDirectory#/#cffile.serverFile#"
		destination="#userphotopath#"
		name="tempImage"
		overwrite="true">
	<!--- add a black border with a thickness of 5 pixels around the image --->
	<cfimage 
		source="#tempImage#" 
		action="border" 
		thickness="5"
    	color="black" 
		destination="#userPhotoPath#" 
		overwrite="true">
	    
	<!--- Resize the photo to create a thumbnail --->    
	<cfimage
		action="resize"
		width="100"
		height="100"
		source="#userPhotoPath#"
		destination="#userThumbPath#"
		overwrite="true">
		
</cfif>	
	
<cfinclude template="upload_form.cfm">
<cfinclude template="user_list.cfm">
