<!-- Listing 66.2 Exercise a .NET Method -->
<cfobject type=".net" 
	protocol="tcp" 
	name="dns" 
	class="System.Net.Dns" 
	action="create" 
	secure="no">

<!--- Retrieve the host name --->
<cfdump var="#dns.GetHostName()#">
