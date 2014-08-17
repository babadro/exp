<!---
Name:          searchform.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Presents a simple form for specifying 
search criteria and numer of rows to display
Date created:   01/05/2005
--->

<html>
<head>
 <title>search form</title>
</head>
<body>

<h2>Personnel Policy Documents</h2>
<p>
<strong>Search Form</strong>

<!--- Create search form --->
<form action="searchresults.cfm" method="post">

<table>
 <tr>
  <td>Keywords:</td>
  <td><input type="text" name="criteria" size="30"></td>
 </tr>
 <tr>
  <td colspan=2>
   <input type="submit" value="Search">
  </td>
 </tr>
</table>

</form>

</body>

</html>
