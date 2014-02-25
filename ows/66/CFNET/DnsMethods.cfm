<!--  Listing 66.1 Instantiate the Dns class in System.Net.Dns class -->
<cfobject type=".net" 
	name="dns" 
	protocol="tcp" 
	class="System.Net.Dns" 
	action="create" 
	secure="no">

<!--- Investigate what the Dns class exposes --->
<cfdump var="#dns#">
