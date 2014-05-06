<cfcomponent>
	
<cffunction name="createItemTemp">
	<cfquery name="createtemptable" datasource="bont">
		
		CREATE TEMPORARY TABLE IF NOT EXISTS itemtemp as (
		SELECT 
		  i.id AS id, i.sold_for AS sold_for, i.sale_date AS sale_date, i.note AS i_note, i.pub_note AS i_pubnote,
		  br.name_eng AS brand,
		  prc.rub AS rub, prc.usd AS usd, prc.note AS price_note,
		  cs.euro_size AS euro_size, cs.bont_size AS bont_size, cs.last_length AS last_len,
		  lw.name_eng AS width,
		  clr.name_eng AS encolor, clr.name_rus AS ruscolor,
		  csm.name_eng AS model, csm.weight AS weight, csm.upper_material AS upper_material,
		  cons.invoice AS invoice, cons.fact_arrival as fact_arrival, cons.expect_arrival AS expect_arrival, cons.note as cons_note,
		  st2.name_rus as cons_status,
		  stat.name_rus AS i_status,
		  CONCAT(comp1.name_rus, ' ', p1.fname_rus, ' ', p1.sname_rus) AS retailer,
		  CONCAT(comp2.name_rus, ' ', p2.fname_rus, ' ', p2.sname_rus) AS buyer  
		FROM item i JOIN (
		  (item_model im JOIN (brand br, statuses st, price prc) ON (im.brand_id=br.id AND im.status_id=st.id AND im.price_id=prc.id)),
		  (cycling_shoe cs JOIN (last_width lw, color clr) ON (cs.last_width_id=lw.id AND cs.color_id=clr.id)),
		  (cycling_shoe_model csm JOIN (cycling_shoe_type cst, cleat_type ct, heat_moldable hm, material m1)
		    ON (csm.type_id=cst.id AND csm.cleat_id=ct.id AND csm.heat_moldable_id=hm.id  AND csm.upper_material=m1.id)),
		  consignment cons JOIN statuses st2 ON cons.status_id=st2.id,
		  statuses stat,
		  company comp1,
		  company comp2,
		  people p1,
		  people p2
		)
		    ON (
		  i.model_id=im.id AND
		  i.id=cs.item_id AND
		  i.model_id=csm.item_model_id AND
		  i.consignment_id=cons.id AND
		  i.status_id=stat.id AND
		  i.retailer_company_id=comp1.id AND
		  i.buyer_company_id=comp2.id AND
		  i.retailer_people_id=p1.id AND
		  i.buyer_people_id=p2.id
		)
		)
	
	</cfquery>
</cffunction>
	
<cffunction name="getData" access="remote" output="false">
	<cfargument name="page">
	<cfargument name="pageSize">
	<cfargument name="gridsortcolumn">
	<cfargument name="gridsortdirection">
	
	<cfset createItemTemp()>
	
	<cfquery name="cyclingshoe" datasource="bont">
		SELECT * FROM itemtemp 
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
	
	<!--- Если надо вывести содержимое "координат" (трех структур) ячейки во внешний файл
	<cfdump var="#gridrow#" format="html" output="C:/ColdFusion9/logs/bind.html">
	<cfdump var="#gridaction#" format="html" output="C:/ColdFusion9/logs/bind.html">
	<cfdump var="#gridchanged#" format="html" output="C:/ColdFusion9/logs/bind.html">
	--->
	
	
	<cfif isStruct(gridrow) and isStruct(gridchanged)>
		<cfif gridaction eq "U">
			<cfset createItemTemp()>
			<cfset colname=structkeylist(gridchanged)>
			<cfset value=structfind(gridchanged,#colname#)>
			<!--- Правим временнную таблицу --->
			<cfquery name="update_temp_table" datasource="bont">
				update itemtemp set <cfoutput>#colname#</cfoutput> =
				'<cfoutput>#value#</cfoutput>'
				where itemtemp.id = <cfoutput>#gridrow.id#</cfoutput>
			</cfquery>
			<!--- Правим разные исходные (постоянные) таблицы, в зависимости от выбранного столбца во временной таблице --->
			<cfswitch expression="#structkeylist(gridchanged)#">
				<cfcase value="model">
					<cfquery name="change_csm_id" datasource="bont">
						UPDATE item i set i.model_id=<cfoutput>#RemoveChars((listLast(gridchanged.model, ' ')), 1, 1)#</cfoutput>
						WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
				</cfcase>
				<cfcase value="sold_for">
					<cfquery name="change_item_sold_for" datasource="bont">
						UPDATE item i set i.sold_for=<cfoutput>#gridchanged.sold_for#</cfoutput>
						WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
				</cfcase>
				<cfcase value="sale_date">
					<cfquery name="change_item_sale_date" datasource="bont">
						UPDATE item i set i.sale_date='<cfoutput>#gridchanged.sale_date#</cfoutput>'
						WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
				</cfcase>
				<cfcase value="i_note">
					<cfquery name="change_item_note" datasource="bont">
						UPDATE item i set i.note='<cfoutput>#gridchanged.i_note#</cfoutput>'
						WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
				</cfcase>
				<cfcase value="i_pubnote">
					<cfquery name="change_item_pubnote" datasource="bont">
						UPDATE item i set i.pub_note='<cfoutput>#gridchanged.i_pubnote#</cfoutput>'
						WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
				</cfcase>
				<cfcase value="brand"><!--- запрос в разработке.
					<cfquery name="change_brand_id" datasource="bont">
						UPDATE item_model im set im.model_id=<cfoutput>#RemoveChars((listLast(gridchanged.model, ' ')), 1, 1)#</cfoutput>
						WHERE i.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
					---->
				</cfcase>
			</cfswitch>
		<cfelse>
		
		<!---
			<cfquery name="team" datasource="cfdocexamples">
				delete from item i where id = <cfoutput>#gridrow.id#</cfoutput>
			</cfquery>
		--->
		</cfif>
	</cfif>
	
	
	

</cffunction>

</cfcomponent>