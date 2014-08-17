<!--- 
 Filename: SimpleFileExplorer.cfm
     Author:  Nate Weiss (NMW)
     Purpose: Provides an interface for exploring files and subfolders
          within the ows root
--->

<!--- The user can explore this folder and any nested subfolders --->
<!--- Assume that the parent of the folder that contains this ColdFusion --->
<!--- page (that is, the "ows" folder) should be considered explorable --->
<cfset baseFolder = expandPath("../")>

<!--- The SubfolderPath variable indicates the currently selected folder --->
<!--- (relative to the BaseFolder). Defaults to an empty string, meaning --->
<!--- that the BaseFolder will be current when the page first appears --->
<cfparam name="subfolderPath" type="string" default="">

<!--- This variable, then, is the full path of the selected folder --->
<cfset folderToDisplay = baseFolder & subfolderPath>

<!--- Get a listing of the selected folder --->
<cfdirectory directory="#folderToDisplay#" name="directoryQuery" sort="Name ASC"
 filter="*">
  
<cfoutput>
 <html>
  <head><title>Simple File Explorer</title></head>
 <body>
 <h3>Simple File Explorer</h3>
 
 <!--- Create a simple form for navigating through folders --->
 <form action="SimpleFileExplorer.cfm" method="post">
 
  <!--- Show the subfolder path, unless already at top level --->
  <cfif subfolderPath EQ "">
   You are at the top level.<br>
  <cfelse>
   Current Folder: #subfolderPath#<br>
  </cfif>
  
  <!--- Provide a drop-down list of subfolder names --->
  Select folder:
  <select name="subfolderPath" onchange="this.form.submit()">
  
   <!--- Provide an option to go up one level to the parent folder, --->
   <!--- unless already at the BaseFolder --->
   <cfif listLen(subfolderPath, "/") gt 0>
    <cfset parentFolder = listDeleteAt(subfolderPath, listLen(subfolderPath, 
    "/"), "/")>
    <option value="#parentFolder#">[parent folder]</option>
   </cfif>
   
   <!--- For each record in the query returned by <cfdirectory> --->
   <cfloop query="DirectoryQuery">
    <!--- If the record represents a subfolder, list it as an option --->
    <cfif Type eq "Dir">
     <option value="#subfolderPath#/#Name#">#Name#</option>
    </cfif>
   </cfloop> 
  </select>
  
  <!--- Submit button to navigate to the selected folder --->
  <input type="submit" value="go">
 </form> 
 
 
 <!--- Use Query of Queries (In Memory Query) to get a subset of --->
 <!--- the query returned by <cfdirectory>. This new query object --->
 <!--- will hold only the file records, not any subfolder records --->
 <cfquery dbtype="query" name="filesQuery">
  SELECT * FROM directoryQuery
  WHERE TYPE = 'File'
 </cfquery>
 
 
 <!--- If there is at least one file to display... ---> 
 <cfif filesQuery.recordCount gt 0>
  <!--- Display the files in a simple HTML table --->
  <table width="500" border="0" cellPadding="1" cellSpacing="0">
   <tr bgcolor="cornflowerblue">
    <th>Filename</th>
    <th>Modified</th>
    <th>Size</th>
   </tr>
 
   <!--- For each file... --->
   <cfloop query="filesQuery">
    <!--- Use alternating colors for the table rows --->
    <cfif filesQuery.currentRow mod 2 eq 0>
     <cfset rowColor = "lightgrey">
    <cfelse> 
     <cfset rowColor = "white">
    </cfif>
    <!--- Display the file details --->   
    <tr bgcolor="#rowColor#">
     <!--- File name --->
     <td width="250">
      #Name#
     </td>
     <!--- File modification date and time --->
     <td width="200">
      #dateFormat(DateLastModified, "m/d/yyyy")#
      at 
      #timeFormat(DateLastModified, "h:mm:ss tt")#
     </td>
     <!--- File size --->
     <td width="50" align="right">
      #ceiling(Size / 1024)# KB
     </td>
    </tr>
   </cfloop> 
  </table>
 </cfif>
 </body>
 </html>
</cfoutput>
