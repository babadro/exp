<!---
Name:          searchresults.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Runs CFSEARCH and displays results.
               The only tricky part is determining
               how to provide link to resulting file.
               It's dependent on type of file and 
               is documented below.
Date created:   01/05/2005
--->

<!--- Run the search against the HRDocs collection --->
<cfsearch name="GetResults"
          collection="owshr"
          criteria="#FORM.criteria#">

<!--- Display results --->
<html>
<head>
 <title>Search Results</title>
</head>

<body>
<h2>Personnel Policy Documents</h2>

<cfoutput>
Search Results: <strong>#FORM.criteria#</strong>
</cfoutput>

<p>

<!--- no files found for specified criteria? --->
<cfif GetResults.RecordCount is 0>

   <strong>No files found for specified criteria</strong>

<cfelse>

 <!--- Found a match --->
 <table cellspacing=0 cellpadding=2>

  <!--- Display results --->
  <cfoutput query="GetResults">
   <!--- alternate line background color --->
   <cfset bgcolor=IIf(CurrentRow Mod 2,
                      DE('ffffff'),
                      DE('ffffcf'))>
   <tr bgcolor="#bgcolor#" valign="top">
    <!--- current row number --->
    <td>#CurrentRow#</td>
    <!--- score --->
    <!--- file name with the link returning the file --->
    <td>
     <!--- 
	HREF to file is produced using either FILE protocol
    or HTTP, depending on whether this is a web document.
    so, we'll look at the file ext to determine if it's
    a web doc or not --->
     <cfset FileName=GetFileFromPath(Key)>
     <cfset Ext=ListLast(FileName, ".")>
     <!--- Display title if there is one, else name --->
     <cfif Trim(Title) IS "">
      <cfset display=GetFileFromPath(Key)>
     <cfelse>
      <cfset display=title>
	 </cfif>
     <!--- Now display it --->
     <a href="#url#">#display#</a> (#score#)
     <br>
     <small>#Context#</small>
    </td>
   </tr>
  </cfoutput>
 </table>

</cfif>

</body>
</html>
