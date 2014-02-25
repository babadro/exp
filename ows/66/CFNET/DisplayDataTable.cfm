<!-- Listing 66.5 Display Data Table Instantiate the DtDemo class in CFNetDemoLib Namespace -->
<cfobject type=".net" 
	protocol="tcp" 
	name="dtDemo" 
	class="CFNETDemoLib.DtDemo" 
    assembly="C:\ColdFusion9DotNetService\CFNetDemo\CFNETDemoLib.dll"
	action="create" 
	secure="no">

<!--- Retrieve the host name --->
<cfdump var="#dtDemo.GetDataTable()#">