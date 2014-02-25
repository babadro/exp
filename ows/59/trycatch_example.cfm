<cftry>
  <cfinvoke method="HTMLSearchAddress" returnvariable="aString"
          webservice=
      "http://www.marotz.se/scripts/searchperson.exe/wsdl/ISearchSwedishPerson"> 
    <cfinvokeargument name="fName" value="Sven"/>
    <cfinvokeargument name="lName" value="Svensson"/>
    <cfinvokeargument name="address" value=""/>
    <cfinvokeargument name="zipCode" value=""/>
    <cfinvokeargument name="city" value=""/>
  </cfinvoke>
   <cfcatch type="any">
     <cfset astring = "Where in the world is Sven Svensson?">
   </cfcatch>
</cftry>

<cfoutput>#aString#</cfoutput>
