<!--- -------------------------------------------------------------
Listing 66.7 Call the ASP.NET Web Service 

In this page a .Net Web Service returns a simple type of type string
to ColdFusion
------------------------------------------------------------ --->
<cfsilent>
	<!--- Call the .Net web service with cfinvoke --->
	<cfinvoke webservice="http://localhost/Webservices1/WebService1.asmx?wsdl" 
          method="HelloWorld"
          returnvariable="result">
</cfsilent>

<!--- Display the value returned from the web service --->
<cfdump var="#result#" />

