<!--- -------------------------------------------------------------
In this page filters are passed to a .Net Web Service that returns 
a DataSet.  The convertDotNetDataset function converts the DataSet 
to a structure of queries.
------------------------------------------------------------ --->
<cfsilent>
	<cffunction name="convertDotNetDataset"
	  returnType="struct">
	  <cfargument name="dataset" required="true" />
	  <cfscript>
		  //Local Variables
		  var result = structNew();
		  var aDataset = dataset.get_any();
		  var xSchema  = xmlParse(aDataset[1]);
		  var xTables = xSchema["xs:schema"]["xs:element"]["xs:complexType"]["xs:choice"];
		  var xData  = xmlParse(aDataset[2]);
		  var xRows = xData["diffgr:diffgram"]["TheDataSet"];
		  var tableName = "";
		  var thisRow = "";
		  var i = 0;
		  var j = 0;
		  		  
		  //Create Queries
		  for(i=1; i LTE arrayLen(xTables.xmlChildren); i = i + 1){
			tableName = xTables.xmlChildren[i].xmlAttributes.name;
			xColumns = xTables.xmlChildren[i].xmlChildren[1].xmlChildren[1].xmlChildren;
			result[tableName] = queryNew("");
			for(j=1; j LTE arrayLen(xColumns); j = j + 1){
				queryAddColumn(result[tableName], xColumns[j].xmlAttributes.name, arrayNew(1));
			}
		  }
		  
		  //Populate Queries
		  for(i=1; i LTE arrayLen(xRows.xmlChildren); i = i + 1){
			thisRow = xRows.xmlChildren[i];
			tableName = thisRow.xmlName;
			queryAddRow(result[tableName], 1);
			for(j=1; j LTE arrayLen(thisRow.xmlChildren); j = j + 1){
				querySetCell(result[tableName], thisRow.xmlChildren[j].xmlName, thisRow.xmlChildren[j].xmlText, result[tableName].recordCount);
			}
		  }
	  </cfscript>
	  <cfreturn result />
	</cffunction>
</cfsilent>
	
<!--- Create arguments for .Net Web Service(Web Method) --->
<cfset args = StructNew() />
<cfset args.sFilter1 = "je" />
<cfset args.sFilter2 = "sh" />

<!--- Invoke the .Net Web Service(Web Method) --->
<cfinvoke webservice="http://localhost/WebServices1/NameService.asmx?wsdl" 
		  method="GetNames" 
		  argumentcollection="#args#" 
		  returnvariable="result" />

<!--- Display array of available methods --->
Initial result that exposes get_any() method:	
<cfdump var="#result#">
<!--- Set and Display array of complex types  --->
<cfset aDataset = result.get_any() />
Array of message elements:
<cfdump var="#aDataset#" />

<!--- Retrieve the schema locate in the first array --->
<cfset xSchema  = xmlParse(aDataset[1]) />
The XML schema contained in the first index:
<cfdump var="#xSchema#">

<!--- Retrieve the tables from the schema --->
<cfset xTables = xSchema["xs:schema"]
	["xs:element"]["xs:complexType"]["xs:choice"] />	
The tables retrieved from the schema:
<cfdump var="#xTables#" />

<!--- Retrieve the data from the second array --->
<cfset xData  = xmlParse(aDataset[2]) />
The data contained in the second index:
<cfdump var="#xData#">

<!--- Wrap your call to the function in a cftry to handle errors.
	  (ie, no dataset returned) --->
<cftry>
	<!--- Convert result to CF queries --->
	<cfset result = convertDotNetDataset(result) />
	<!--- Display --->
	The result (structure of queries):
	<cfdump var="#result#" />
	<cfcatch type="any">
		The Webservice did not return a result.
	</cfcatch>
</cftry>	
