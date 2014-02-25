<!---
Name:        navigate.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Navigate example
--->

<cfpod title="Load Stuff" name="mypod" />

<a href="" onClick=
"ColdFusion.navigate('content1.cfm','mypod');
return false">Load Content1</a>

<a href="" onClick=
"ColdFusion.navigate('content2.cfm','mypod');
return false">Load Content2</a>