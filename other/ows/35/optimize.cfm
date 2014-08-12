<!--- 
Module:         Optimize.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Optimizes a collection.
Date created:   01/05/2005
--->

<html>
<head>
 <title>Optimizing Verity Collection</title>
</head>
<body>


<!--- feedback --->
Performing optimization ...<br>
<cfflush>

<!--- optimize the verity collection --->
<cfcollection action="optimize"
              collection="owshr">

<!--- feedback --->
Done!
<cfflush>

</body>
</html>
