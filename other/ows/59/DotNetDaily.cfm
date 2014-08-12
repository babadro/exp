<cfinvoke webservice="http://www.xmlme.com/WSDailyNet.asmx?WSDL" 
          method="getDotnetDailyFact" returnvariable="aString" />
 
<cfoutput>
Your Daily DotNet for #dateFormat(now(), "MM-dd-yyyy")#:<br>
#aString#
</cfoutput>
