<!---
Filename: processddx.cfm
Author: John C. Bland II (jcbii)
Purpose: Processes DDX output and displays it
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

			<!--- Determine the output folder path --->
			<cfset folder = "pdfs" />
			<cfif form.outputtype NEQ "pdf">
			 <cfset folder = "data" />
			</cfif>

      <!--- Construct output files struct --->
      <cfset output = StructNew() />
      <cfset output.Output1 = folder&"/"
			           & Replace(form.ddxfile, ".ddx", "."&form.outputtype) />

      <!--- Process DDX --->
			<cfpdf name="myBook" action="processddx" inputfiles="#input#"
             outputfiles="#output#" ddxfile="ddx/#form.ddxfile#" />

      <!--- Output result --->
      <cfoutput>
         <strong>DDX instruction processing: #myBook.Output1#</strong>
      </cfoutput>
			<!--- If the output is successful and type is xml, read and
			       display the file contents --->
      <cfif form.outputtype EQ "xml" AND myBook.Output1 EQ "successful">
			   <br />
         <cffile variable="xmloutput"
                 file="#ExpandPath(output.Output1)#"
                 action="read" charset="utf-8" />
         <cfoutput>#XMLFormat(xmloutput)#</cfoutput>
				 <hr />
      </cfif>
   <cfelse>
      <!--- Invalid DDX --->
      <cfoutput>
         <strong>ddx/#form.ddxfile# is not a valid DDX file</strong>
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
   Output type:
   <cfselect name="outputtype">
      <option value="pdf">pdf</option>
      <option value="xml">xml</option>
   </cfselect>
	 <br />
   <cfinput name="submitButton" type="submit" value="Submit" />
</cfform>