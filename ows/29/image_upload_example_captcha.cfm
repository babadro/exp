<cfset imageDirPath = ExpandPath("user_photos")>
<!--- This is our default captcha text--->
<!--- In real life you would want to use a random Text generator --->
<cfset captchaText = "CFWACK"/>
<!--- Form param for the captcha entered text --->
<cfparam name="FORM.captchaTextField" default=""/>
<!--- get the list of users from the DB --->
<cfquery name="get_users" datasource="ows">
    SELECT * 
    FROM Contacts
    ORDER BY lastname, firstname
</cfquery>

<cfif isDefined("form.fileToUpload") and form.fileToUpload neq "">

    <cfif not directoryExists(imageDirPath)>
        <cfdirectory action="create" directory="#imageDirPath#">
    </cfif>

    <!--- Check if the user is human --->
    <cfif captchaText eq TRIM(FORM.captchaTextField)>	
        <cfset isHuman = true />
    <cfelse>
        <cfset isHuman = false/>
    </cfif>

    <!--- If the user passes as human then move on to handle the file upload --->
    <cfif isHuman eq true>

    <cfset userPhotoPath = "#imageDirPath#/user_#form.contactid#.jpg">
    <cfset userThumbPath = "#imageDirPath#/user_#form.contactid#_thumb.jpg">
	
    <!--- Accept the file upload --->
    <cffile action="upload" destination="#getTempDirectory()#"
    fileField="fileToUpload" nameConflict="overwrite" />

    <!--- Get info about the photo --->
    <cfimage action="info"
    source="#cffile.serverDirectory#/#cffile.serverFile#"
    structName="uploadedFileInfo">

    <cfif uploadedFileInfo.width lt 100 
    or uploadedFileInfo.height lt 100
    or uploadedFileInfo.width gt 1000
    or uploadedFileInfo.height gt 1000>
     <cfthrow 
	 message="Please provide an image between 100 and 1000 pixels tall and wide.">
    </cfif>
	
	<!--- Convert the photo and write it to a variable--->
    <cfimage action="convert" 
	source="#cffile.serverDirectory#/#cffile.serverFile#"
    destination="#userPhotoPath#" name="tempImage"
    overwrite="true"/>
	
    <!--- create a watermark from an existing image. --->
    <cfimage source="copyright.gif" name="myImage2"/>
			
    <cfset ImageSetDrawingTransparency(tempImage,50)>
    <!--- Paste myImage2 on myImage at the coordinates (0,0). --->
    <cfset ImagePaste(tempImage,myImage2,0,0)>
    <!--- Write the result to a file. --->
		
    <!--- add a black border with a thickness of 5 pixels around the image --->
    <cfimage source="#tempImage#" action="border" 
    thickness="5" color="black" destination="#userPhotoPath#" 
    overwrite="true"/>
	    
	<cfquery name="get_user" datasource="ows">
	SELECT * 
	FROM Contacts
	Where  CONTACTID = 
	<cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactid#">
	</cfquery>
	    
	<!--- Resize the photo to create a thumbnail --->    
    <cfimage action="resize" width="100" height="100"
    source="#userPhotoPath#" destination="#form.contactid#_thumb.jpg"
    name="tempThumbImage" overwrite="true"/>
		
    <!---  Draw text --->
    <!--- Set the text attributes. --->
    <cfset attr = StructNew()>
    <cfset attr.underline = "yes">
    <cfset attr.size = 10>
    <cfset attr.style = "bold">
    <cfset ImageSetDrawingColor(tempThumbImage,"black")>
    <cfset ImageDrawText(tempThumbImage, 
	"#trim(get_user.firstname)# #trim(get_user.lastname)#",5, 90, attr)>

    <!--- Write out image to the file system --->
    <cfimage source="#tempThumbImage#" action="write" 
    destination="#userThumbPath#" overwrite="true"/>   
		
    <cfelse>
        <!--- Refresh Page --->    
        <cflocation url="#CGI.SCRIPT_NAME#" addtoken="false"/>
    </cfif>
</cfif>	
	
<cfinclude template="upload_form2.cfm">
<cfinclude template="user_list.cfm">
