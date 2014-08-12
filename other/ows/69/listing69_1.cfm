<!---
   Name:        listing69_1.cfm
   Author:      Josh Adams
   Description: Makes a call to the ColdFusion 9 Exposed Services Layer
                Image Service
   Created:     May 25, 2010
--->

<!---Call the GetHeight operation of the ImageService Web Service.--->
<cfinvoke
   webservice="http://localhost/CFIDE/services/image.cfc?wsdl"
   method="GetHeight"
   returnVariable="variables.returnVar" >
   
   <!---Pass the values for serviceusername, servicepassword, and source.--->
   <cfinvokeargument name="serviceusername" value="remoteuser" />
   <cfinvokeargument name="servicepassword" value="remoteuserpassword" />
   <cfinvokeargument name="source"
      value="http://www.adobe.com/ubi/globalnav/include/adobe-lq.png" />
</cfinvoke>

<!---
   Output the returned value, which is the height of the image specified in
   the source argument of the Web Service call.
--->
<cfoutput>#variables.returnVar#</cfoutput>