<cffunction name="passURLvars" returnType="string" output="false">
	<cfargument name="exceptions" default="">
	<cfset var passVars = "">
	<cfset var v = "">
	
	<cfset exceptions = listAppend(Exceptions, "jsessionid,cftoken,cfid")>
	
	<cfif isdefined("SESSION.urlToken")>
		<cfset passVars = SESSION.urlToken>
	<cfelseif isDefined("CLIENT.urlToken")>
		<cfset passVars = CLIENT.urlToken>
	</cfif>
	
	<cfloop list="#structKeyList(URL)#" index="v">
		<cfif not listFindNoCase(exceptions, v)>
			<cfset passVars = listAppend(passVars, "#v#=#urlEncodedFormat(URL[v])#", "&")>
		</cfif>
	</cfloop>
	
	<cfreturn passVars>
</cffunction>

<cffunction name="passFormVars" returnType="string" output="false">
	<cfargument name="exceptions" default="">
	
	<cfset var passVars = "">
	<cfset var v = "">
	<cfset var lastPartOfVarName = "">
	
	<cfset exceptions = listAppend(exceptions, "FIELDNAMES")>
	
	<cfloop list="#structKeyList(FORM)#" index="v">
		<cfif not listFindNoCase(exceptions, v)>
			<cfset lastPartOfVarName = ListLast(v, "_")>
			
			<cfif not listFindNoCase("required,date,integer,float", lastPartOfVarName)>
				<cfset passVars = passVars & '<input type="hidden" name="#v#" value="#htmlEditFormat(FORM[v])#">'>
			</cfif>
		</cfif>
	</cfloop>
	
	<cfreturn passVars>
	
</cffunction>