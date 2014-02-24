
<cfset form1="a,b,c">

<cfoutput>#listGetAt(form1, 2)#</cfoutput>
<cfoutput>#listLast("a", "_")#</cfoutput>

<cfloop list="#form1#" index="v">
    
      <cfset lastPartOfVarName = ListLast(v, "_")>
      <cfoutput>#lastPartOfVarName#</cfoutput>      
    
  </cfloop>