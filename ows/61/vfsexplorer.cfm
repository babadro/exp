<!--- 
 Filename: vfsxplorer.cfm
     Author:  Nate Weiss (NMW), modified by Ray
     Purpose: Provides an interface for exploring files and subfolders
          within the ows root
--->

<cfset vfsInfo = getVFSMetaData("ram")>
<cfif not vfsInfo.enabled>
    <p>
	Sorry, but the virtual file system is not enabled!
	</p>
	<cfabort>
</cfif>

<cfset baseFolder = "ram://">

<cfparam name="subfolderPath" type="string" default="">

<cfset folderToDisplay = baseFolder & subfolderPath>

<cfdirectory directory="#folderToDisplay#" name="directoryQuery" sort="Name ASC"
 filter="*">

<cfoutput>
 <html>
  <head><title>Virtual File Explorer</title></head>
 <body>
 <h3>Virtual File Explorer</h3>
 
 <p>
 The virtual file system has a limit  #numberFormat(vfsInfo.limit)# bytes 
 and is currently using #numberFormat(vfsInfo.used)# bytes. 
 There are #numberFormat(vfsInfo.free)# bytes left.
 </p>
 
 <form action="vfsexplorer.cfm" method="post">
 
  <cfif subfolderPath EQ "">
   You are at the top level.<br>
  <cfelse>
   Current Folder: #subfolderPath#<br>
  </cfif>
  
  Select folder:
  <select name="subfolderPath" onchange="this.form.submit()">
  
   <cfif listLen(subfolderPath, "/") gt 0>
    <cfset parentFolder = listDeleteAt(subfolderPath, listLen(subfolderPath, 
    "/"), "/")>
    <option value="#parentFolder#">[parent folder]</option>
   </cfif>
   
   <cfloop query="DirectoryQuery">
    <cfif Type eq "Dir">
     <option value="#subfolderPath#/#Name#">#Name#</option>
    </cfif>
   </cfloop> 
  </select>
  
  <input type="submit" value="go">
 </form> 
  
 <cfquery dbtype="query" name="filesQuery">
  SELECT * FROM directoryQuery
  WHERE TYPE = 'File'
 </cfquery>
 
 <cfif filesQuery.recordCount gt 0>
  <table width="500" border="0" cellPadding="1" cellSpacing="0">
   <tr bgcolor="cornflowerblue">
    <th>Filename</th>
    <th>Modified</th>
    <th>Size</th>
   </tr>
 
   <cfloop query="filesQuery">
    <cfif filesQuery.currentRow mod 2 eq 0>
     <cfset rowColor = "lightgrey">
    <cfelse> 
     <cfset rowColor = "white">
    </cfif>

    <tr bgcolor="#rowColor#">
     <td width="250">
      #Name#
     </td>
     <td width="200">
      #dateFormat(DateLastModified, "m/d/yyyy")#
      at 
      #timeFormat(DateLastModified, "h:mm:ss tt")#
     </td>
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
