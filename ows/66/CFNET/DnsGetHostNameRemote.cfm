<!-- Listing 66.3 Call a Remote Method -->
<cfobject type=".net" 
	name="dns" 
	class="System.Net.Dns" 
	action="create" 
	port="6086" 
	secure="no" 
	server="strikefish"
	assembly="C:\ColdFusion9\DotNetJars\FirstProject.jar">

<!--- Retrieve the host name --->
<cfdump var="#dns.GetHostName()#">
