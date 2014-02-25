<!--- 
Module:         indexing.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Indexes HTML, Text, Word and Excel 
				content for owshr collection.
Date created:   01/05/2005
--->

Indexing documents ...<br>
<cfflush>

<!--- Index the owshr collection --->
<cfindex collection="owshr"
         action="refresh"
         type="path"
         key="c:\coldfusion8\wwwroot\ows\39\hr\docs\"
         extensions=".htm, .html, .txt, .doc, .xls"
         recurse="yes"
         urlpath="http://localhost:8501/ows/39/hr/docs">

Done!
