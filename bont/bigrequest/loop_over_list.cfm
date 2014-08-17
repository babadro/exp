<cfset model_id="1,2,3,5">
<cfif isDefined("model_id")>
	<cfset list_model_id = #model_id#>
	<cfloop list="#list_model_id#" index="id" >
		<cfif listFind(list_model_id, id) eq 1>
			<cfoutput>WHERE model_id=#id#</cfoutput>
		<cfelse>
			<cfoutput>OR model_id=#id#</cfoutput>
		</cfif>
	</cfloop> 
</cfif>