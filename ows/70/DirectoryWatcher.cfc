<cfcomponent>

  <cffunction name="onAdd" output="no">
    <cfargument name="CFEvent" type="struct">
    <!--- get event data --->
    <cfset data=CFEvent.data>
    <!--- watcher will ignore outgoing messages --->
    <!--- Location of images --->
    <cfset GalleryFolder = ExpandPath("gallery")>
    <!--- Get list of images --->
     <cftry>
       <cfdirectory  action="list"
                     name="GetImages"
                     directory="#GalleryFolder#"
                     filter="*.jpg">
       <!--- Loop over images ---> 
       <cfloop query="GetImages">
       <!--- Proposed location of thumbnail --->
       <cfset ThumbPath = ExpandPath("gallery/thumbs/#Name#")>
       <!--- If the thumbnail does not exist --->
       <cfif not FileExists(ThumbPath)>
         <!--- Invoke our image-resizing function --->
         <cfimage action="resize"
                  height = "25%"
                  source="#GalleryFolder#/#Name#"
                  width="25%"
                  destination="#ThumbPath#"
                  overwrite="true" />
       </cfif>
       <cfscript>
         logMessage = structNew();
         logMessage.message = "watch";
         logMessage.message = "a file was #data.type# and the name was #data.filename#";
       </cfscript>
       <cfset logAppInfo = SendGatewayMessage("DataLogger", logMessage)>
     </cfloop>
     <!--- log a message --->
     <cfcatch type="Any">
     <cfscript>
        logMessage = structNew();
        logMessage.message = "watch";
        logMessage.message = "An exception, #CFCATCH.TYPE#, was thrown in DirectoryWatcher.CFC, the error message is #cfcatch.message#";
     </cfscript>
     </cfcatch>
   </cftry>
 </cffunction>
 </cfcomponent>