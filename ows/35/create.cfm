<!--- 
Module:         create.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Create a new collection.
Date created:   01/05/2005
--->

<html>
<head>
 <title>Creating Verity Collection</title>
</head>
<body>


<!--- feedback --->
Creating collection ...<br>
<cfflush>

<!--- Create the new verity collection --->
<cfcollection action="create"
              collection="finance"
              path="c:\coldfusion8\Verity\Collections\">

<!--- feedback --->
Done!
<cfflush>

</body>
</html>
