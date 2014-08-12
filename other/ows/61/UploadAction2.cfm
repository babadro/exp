<!--- 
 Filename: UploadAction.cfm
 Edited By: Nate Weiss (NMW)
 Purpose:  Demonstrates how to accept a file upload from the browser machine
--->

<!--- Template to process uploaded files from user --->
<html>
<head>
 <title>&lt;cffile&gt; Upload Demonstration - Example 2</title>
</head>

<body>
<h3>&lt;cffile&gt; Upload Demonstration - Example 2</h3>

<!--- Accept the actual file upload --->
<!--- The file will be placed into the same folder as this ColdFusion page --->
<cffile destination="#getDirectoryFromPath(getBaseTemplatePath())#"
 action="upload" nameConflict="#form.fileAction#" filefield="fileName">
 
<!--- Output information about the status of the upload ---> 
<cfoutput>
 <p>
  &lt;cffile&gt; Tag File Upload Demonstration Results - Example 1<br>
  File Upload was Successful! Information about the file is detailed below
 </p>
 <table border="1">
  <caption><b>File Information</b></caption>
  <tr valign="top">
   <th align="left">File Name:</th>
   <td>#cffile.ServerDirectory#\ #cffile.ServerFile#</td>
   <th align="left">Content Type:</th><td>#cffile.ContentType#</td>
  </tr>
  <tr valign="top">
   <th align="left">Content SubType:</th>
   <td>#cffile.ContentSubType#</td>
   <th align="left">Client Path:</th>
   <td>#cffile.ClientDirectory#</td>
  </tr>
  <tr valign="top">
   <th align="left">Client File:</th>
   <td>#cffile.ClientFile#</td>
   <th align="left">Client FileName:</th>
   <td>#cffile.ClientFileName#</td>
  </tr>
  <tr valign="top">
   <th align="left">Client FileExt:</th>
   <td>#cffile.ClientFileExt#</td>
   <th align="left">Server Path:</th>
   <td>#cffile.ServerDirectory#</td>
  </tr>
  <tr valign="top">
   <th align="left">Server File:</th>
   <td>#cffile.ServerFile#</td>
   <th align="left">Server FileName:</th>
   <td>#cffile.ServerFileName#</td>
  </tr>
  <tr valign="top">
   <th align="left">Server FileExt:</th>
   <td align="left">#cffile.ServerFileExt#</td>
   <th align="left">Attempted ServerFile:</th>
   <td>#cffile.AttemptedServerFile#</td>
  </tr>
  <tr valign="top">
   <th align="left">File Existed?</th>
   <td>#cffile.FileExisted#</td>
   <th align="left">File Was Saved?</th>
   <td>#cffile.FileWasSaved#</td>
  </tr>
  <tr valign="top">
   <th align="left">File Was Overwritten?</th>
   <td>#cffile.FileWasOverWritten#</td>
   <th align="left">File Was Appended?</th>
   <td>#cffile.FileWasAppended#</td>
  </tr>
  <tr valign="top">
   <th align="left">File Was Renamed?</th>
   <td>#cffile.FileWasRenamed#</td>
   <th align="left">File Size:</th>
   <td>#cffile.Filesize#</td></th>
  </tr>
  <tr valign="top">
   <th align="left">Old File Size:</th>
   <td>#cffile.OldFileSize#</td>
   <th align="left">Date Last Accessed:</th>
   <td>#dateFormat(cffile.DateLastAccessed,'dd mmm yyyy')#</td>
  </tr>
  <tr valign="top">
   <th align="left">Date/Time Created:</th>
   <td>
    #dateFormat(cffile.TimeCreated,'dd mmm yyyy')# 
    #timeformat(cffile.TimeCreated,'hh:mm:ss')#
   </td>
   <th align="left">Date/Time Modified:</th>
   <td>
    #dateFormat(cffile.TimeLastModified,'dd mmm yyyy')# 
    #timeformat(cffile.TimeLastModified,'hh:mm:ss')#
   </td>
  </tr>
 </table>
</cfoutput>
</body>
</html>
