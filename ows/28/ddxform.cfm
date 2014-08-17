<!---
Filename: ddxform.cfm
Author: John C. Bland II (jcbii)
Purpose: Accepts user input and processes a ddx file
--->

<!--- Check for the form field "ddxfile" --->
<cfif structKeyExists(form, "ddxfile")>
   <!--- verify the file is valid DDX --->
   <cfif isDDX(ExpandPath("ddx/#form.ddxfile#"))>
      <!--- Construct input files struct --->
      <cfset input = StructNew() />
      <cfset input.TitlePage = "samples/title.pdf" />
      <cfset input.SamplePage = "samples/page.pdf"/>
      <cfset input.Comps = "samples/comps.pdf" />

      <!--- Construct output files struct --->
      <cfset output = StructNew() />
		<!--- Set the Output1 filename --->
      <cfset output.Output1 = "pdfs/"&Replace(form.ddxfile,".ddx", ".pdf") />

      <!--- Process DDX --->
      <cfpdf name="myBook" action="processddx" inputfiles="#input#"
             outputfiles="#output#" ddxfile="ddx/#form.ddxfile#" />

      <!--- Output result --->
      <cfoutput>
         <strong>DDX instruction processing: #myBook.Output1#</strong>
				 <hr />
      </cfoutput>
   <cfelse>
      <!--- Invalid DDX --->
      <cfoutput>
      <strong>ddx/#form.ddxfile# is not a valid DDX file.</strong>
      </cfoutput>
   </cfif>
</cfif>

<!--- Filter the /ddx directory for all ddx files --->
<cfdirectory name="ddxDirectory" action="list" filter="*.ddx"
             directory="#ExpandPath('ddx')#" />

<!--- Create a form for processing DDX;
        preservedata for ease of testing --->
<cfform name="DDXSelector" preservedata="yes">
  Select a DDX File: <cfselect name="ddxfile" query="ddxDirectory"
                       required="yes" display="name" value="name" />
  <br />
  <cfinput name="submitButton" type="submit" value="Submit" />
</cfform>