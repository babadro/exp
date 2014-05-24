<cfoutput>Удаление строки</cfoutput>
<cfquery name="select_pattern" datasource="bont">
	SELECT p.pattern as p FROM
	item i JOIN item_model im ON i.model_id=im.id JOIN pattern p ON im.pattern_id=p.id
	WHERE i.id = 99
</cfquery>
<cfset table = select_pattern.p>
<cfquery name="delete_from_child_table">
	DELETE FROM <cfoutput>#table#</cfoutput> WHERE <cfoutput>#table#</cfoutput>.item_id=<cfoutput>#gridrow.id#</cfoutput>
</cfquery> 