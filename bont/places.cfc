<cfcomponent>
<cffunction name="getData" access="remote" output="false">
<cfargument name="page">
<cfargument name="pageSize">
<cfargument name="gridsortcolumn">
<cfargument name="gridsortdirection">
<cfquery name="cyclingshoe" datasource="bont">
SELECT 
	i.id as "id", csm.name_eng AS "model", i.sold_for AS "sold_for",
	c.name_rus as "retailer_company", p.fname_rus as "retailer_fname",
	p.sname_rus as "retailer_sname", cs.euro_size as "size", clr.name_eng AS "color",
	lw.name_eng AS "last_width", st.name_rus as "status"
  FROM item i 
    JOIN item_model im ON i.model_id=im.id
    JOIN cycling_shoe_model csm ON im.id=csm.item_model_id
    JOIN company c ON i.retailer_company_id=c.id
    JOIN people p ON i.retailer_people_id=p.id
    JOIN cycling_shoe cs ON i.id=cs.item_id
    JOIN color clr ON cs.color_id=clr.id
    JOIN last_width lw ON cs.last_width_id=lw.id
    JOIN statuses st ON i.status_id=st.id
<cfif gridsortcolumn neq "" and gridsortdirection neq "">
	order by #gridsortcolumn# #gridsortdirection#
</cfif>
</cfquery>
<cfreturn QueryConvertForGrid(cyclingshoe, page, pageSize)>
</cffunction>

<cffunction name="editData" access="remote" output="false">
	<cfargument name="gridaction">
	<cfargument name="gridrow">
	<cfargument name="gridchanged">
	
	<!---<cfdump var="#gridrow#" format="html" output="C:/ColdFusion9/logs/bind.html">
	<cfdump var="#gridaction#" format="html" output="C:/ColdFusion9/logs/bind.html">
	<cfdump var="#gridchanged#" format="html" output="C:/ColdFusion9/logs/bind.html">--->
	
	
	<cfif isStruct(gridrow) and isStruct(gridchanged)>
		<cfif gridaction eq "U">
			<!---
			
			<cfset colname=structkeylist(gridchanged)>
			<cfset value=structfind(gridchanged,#colname#)>
			
			<cfquery name="team" datasource="cfdocexamples">
				update employees set <cfoutput>#colname#</cfoutput> =
				'<cfoutput>#value#</cfoutput>'
				where Emp_ID = <cfoutput>#gridrow.Emp_ID#</cfoutput>
			</cfquery>
			--->
			
			<cfquery name="change_csm_id" datasource="bont">
				UPDATE item i set i.model_id=<cfoutput>#RemoveChars((listLast(gridchanged.model, ' ')), 1, 1)#</cfoutput>
				WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
			</cfquery>
		<cfelse><!---
			<cfquery name="team" datasource="cfdocexamples">
				delete from item i where id = <cfoutput>#gridrow.id#</cfoutput>
			</cfquery>
			--->
		</cfif>
	</cfif>
	
	
	

</cffunction>

</cfcomponent>