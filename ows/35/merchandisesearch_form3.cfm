<!---
Name:          merchandisesearch_form3.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Presents simple search form for searching
               for merchandise
Date created:  01/05/2005
--->

<!--- Create a search form --->
<html>
<head>
   <title>Merchandise Search</title>
</head>

<body>

<h2>Please enter keywords to search for.</h2>

<form action="merchandisesearch_action3.cfm"
      method="post">
Keywords: <input type="text" name="criteria">
<br>
<input type="submit" value="Search">
</form>

</body>
</html>
