<!---
Name:        search2.cfm
Author:      Ben Forta (ben@forta.com)
Description: Creating search screens
Created:     07/01/07
--->

<html>

<head>
 <title>Orange Whip Studios - Movies</title>
</head>

<body>

<!--- Page header --->
<cfinclude template="header.cfm">

<!--- Search form --->
<form action="results2.cfm" method="POST">

<table align="center" border="1">
 <tr>
  <td>
  Movie:
  </td>
  <td>
  <input type="text" name="MovieTitle">
  </td>
 </tr>
 <tr>
  <td>
  Tag line:
  </td>
  <td>
  <input type="text" name="PitchText">
  </td>
 </tr>
 <tr>
  <td>
  Rating:
  </td>
  <td>
  <input type="text" name="RatingID"> (1-6)
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
  <input type="submit" value="Search">
  </td>
 </tr>
</table>

</form>

</body>

</html>