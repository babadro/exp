<!---
Name:          merchandisesearch_form6.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Presents simple search form for searching
               against multiple collections
Date created:  01/05/2005
--->

<!--- Create a search form --->
<html>
<head>
   <title>Merchandise Search</title>
</head>

<body>

<h2>Please enter keywords to search for.</h2>

<form action="merchandisesearch_action6.cfm"
      method="post">
Keywords: <input type="text" name="criteria">
<br>
Collections (select at least 1):
<INPUT TYPE="Checkbox"
       NAME="Collection"
       VALUE="Merchandise">Merchandise
<INPUT TYPE="Checkbox"
       NAME="Collection"
       VALUE="owshr">Personnel Policies
<br>
<input type="submit"
       value="Search">
</form>

</body>
</html>
