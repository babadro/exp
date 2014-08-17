<!---
Filename: resume-manager.cfm
Author: John C. Bland II (jcbii)
Purpose: Manages resumes file uploads
--->

<!--- Query the database for contacts --->
<cfquery name="contacts" datasource="ows">
  SELECT * FROM app.contacts
</cfquery>

<!--- Table display of current contact information --->
<table width="100%">
  <!--- Table headers --->
  <tr style="font-weight:bold;">
	 <td>Resume</td>
	 <td>Name</td>
	 <td>Address</td>
	 <td>State</td>
	 <td>Zip</td>
	 <td>Country</td>
	 <td>Phone</td>
	</tr>
	<!--- Output contacts in table --->
  <cfoutput query="contacts">
	 <!--- Determine if the current contact (row) has a saved resume --->
	 <cfset hasResume = isPDFFile("pdfs/contacts/"&contactid&".pdf") />
	 <tr>
	   <td>
	    <cfif hasResume>
	     <!--- the resume exists, display links to open --->
			 <a href="pdfs/contacts/#contactid#.doc">Word</a> |
			 <a href="pdfs/contacts/#contactid#.pdf">PDF</a>
			<cfelse>
			 <!--- the resume doesn't exist, display the upload form --->
			 <cfform name="form#contactid#" action="resume-file-upload.cfm"
			         enctype="multipart/form-data">
			   <input type="hidden" name="contact" value="#contactid#" />
			   <input type="file" name="resume" size="10" />
				 <input type="submit" value="Upload" />
			 </cfform>
			</cfif>
		 </td>
		 <td><a href="mailto:#email#">#firstname# #lastname#</a></td>
		 <td>#address#</td>
		 <td>
		  <cfif len(trim(state)) EQ 0>
        <!--- show a filler for empty states --->
        --
			<cfelse>
        <!--- state isn't empty, display state --->
        #state#
			</cfif>
		 </td>
		 <td>#zip#</td>
		 <td>#country#</td>
		 <td>#phone#</td>
	 </tr>
  </cfoutput>
</table>