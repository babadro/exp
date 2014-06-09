<cfcomponent>
	
<cffunction name="createItemTemp">
	<cfquery name="createtemptable" datasource="bont">
		
		CREATE TEMPORARY TABLE IF NOT EXISTS itemtemp as (
		SELECT 
		  i.id AS id, i.sold_for AS sold_for, i.sale_date AS sale_date, i.note AS i_note, i.pub_note AS i_pubnote,
		  br.name_eng AS brand, br.id as brand_id,
		  prc.rub AS rub, prc.usd AS usd, prc.note AS price_note,
		  cs.euro_size AS euro_size, cs.bont_size AS bont_size, cs.last_length AS last_len,
		  lw.name_eng AS width, lw.id AS last_width_id,
		  CONCAT(clr.name_eng, ' ', clr.name_rus) AS color, clr.id AS color_id,
		  csm.item_model_id AS model_id, csm.name_eng AS model, csm.weight AS weight,
      	  ct.id AS cleat_type_id, 
		  m1.name_rus AS upper_material,
		  cons.invoice AS invoice, cons.fact_arrival as fact_arrival, cons.expect_arrival AS expect_arrival, cons.note as cons_note,
		  st2.name_rus AS cons_status, st2.id AS cons_status_id,
		  stat.name_rus AS i_status, stat.id AS i_status_id,
		  CONCAT(comp1.name_rus, ' ', p1.fname_rus, ' ', p1.sname_rus) AS retailer,
		  comp1.id AS company_retailer_id, p1.id AS people_retailer_id, 
		  CONCAT(comp2.name_rus, ' ', p2.fname_rus, ' ', p2.sname_rus) AS buyer,
     	  comp2.id AS company_buyer_id, p2.id AS people_buyer_id  
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

<!----
<cffunction name="insertWhereOrStatement" output="true">
	<cfargument name="структура какая нибудь">
	<cfloop через структуру>
		<cfif элемент без окончания Мин или МАХ></cfif>
	</cfloop>
</cffunction>
---->

	
<cffunction name="getData" access="remote" output="false">
	<cfargument name="page">
	<cfargument name="pageSize">
	<cfargument name="gridsortcolumn">
	<cfargument name="gridsortdirection">
	
	<cfset createItemTemp()>
	<cfset var cyclingshoe="">
	<cfquery name="cyclingshoe" datasource="bont">
		SELECT * FROM itemtemp 
		WHERE
		
		<cfif isDefined("SESSION.conditionQuery.model_id")>
			(
			<cfset var list_model_id = #SESSION.conditionQuery.model_id#>
			<cfloop list= "#list_model_id#" index="id" >
				<cfif listFind(list_model_id, id) eq 1>
					model_id=#id#
				<cfelse>
					OR model_id=#id#
				</cfif>
			</cfloop>
			) AND
		</cfif>
		
			<cffunction name="insertWhereOrStatToQuery" description="Insert where-or statement to query">
				<cfargument name="param" required="true">
				<cfargument name="colName" required="true">
				<cfoutput>	
					<cfif isDefined("param")>
						(
						<cfset var list_val = #param#>
						<cfloop list= "#list_val#" index="val" >
							<cfif listFind(list_val, val) eq 1>
								#colName#=#val#
							<cfelse>
								OR #colName#=#val#
							</cfif>
						</cfloop>
						) AND
					</cfif>
				</cfoutput>
			</cffunction>
		
		<cfif isDefined("SESSION.conditionQuery.brand_id")>
			(
			<cfset var list_brand_id = #SESSION.conditionQuery.brand_id#>
			<cfloop list= "#list_brand_id#" index="id" >
				<cfif listFind(list_brand_id, id) eq 1>
					brand_id=#id#
				<cfelse>
					OR brand_id=#id#
				</cfif>
			</cfloop>
			) AND		
		</cfif>
		
		<cfif isDefined("SESSION.conditionQuery.cleat_type_id")>
			(
			<cfset var list_cleat_type_id = #SESSION.conditionQuery.cleat_type_id#>
			<cfloop list= "#list_cleat_type_id#" index="id" >
				<cfif listFind(list_cleat_type_id, id) eq 1>
					cleat_type_id=#id#
				<cfelse>
					OR cleat_type_id=#id#
				</cfif>
			</cfloop>
			) AND		
		</cfif>
		
		<cfif isDefined("SESSION.conditionQuery.last_width_id")>
			(
			<cfset var list_last_width_id = #SESSION.conditionQuery.last_width_id#>
			<cfloop list= "#list_last_width_id#" index="id" >
				<cfif listFind(list_last_width_id, id) eq 1>
					last_width_id=#id#
				<cfelse>
					OR last_width_id=#id#
				</cfif>
			</cfloop>
			) AND		
		</cfif>
		
		<cfif isDefined("SESSION.conditionQuery.color_id")>
			(
			<cfset var list_color_id = #SESSION.conditionQuery.color_id#>
			<cfloop list= "#list_color_id#" index="id" >
				<cfif listFind(list_color_id, id) eq 1>
					color_id=#id#
				<cfelse>
					OR color_id=#id#
				</cfif>
			</cfloop>
			) AND		
		</cfif>
		
		<cfif isDefined("SESSION.conditionQuery.consignment_status_id")>
			(
			<cfset var list_consignment_status_id = #SESSION.conditionQuery.consignment_status_id#>
			<cfloop list= "#list_consignment_status_id#" index="id">
				<cfif listFind(list_consignment_status_id, id) eq 1>
					cons_status_id=#id#
				<cfelse>
					OR cons_status_id=#id#
				</cfif>
			</cfloop>
			) AND		
		</cfif>
		
		<cfif isDefined("SESSION.conditionQuery.item_status_id")>
			(
			<cfset var list_item_status_id = #SESSION.conditionQuery.item_status_id#>
			<cfloop list= "#list_item_status_id#" index="id">
				<cfif listFind(list_item_status_id, id) eq 1>
					i_status_id=#id#
				<cfelse>
					OR i_status_id=#id#
				</cfif>
			</cfloop>
			) AND		
		</cfif>
	
		<cfif isDefined("SESSION.conditionQuery.retailer_data")>
			(
			<cfset var list_retailer_data = #SESSION.conditionQuery.retailer_data#>
			<cfloop list= "#list_retailer_data#" index="retailer">
				<cfif listFind(list_retailer_data, retailer) eq 1>
					<cfswitch expression="#listFirst(retailer, '_')#">
						<cfcase value="people">people_retailer_id=#listLast(retailer, '_')#</cfcase>
						<cfcase value="company">company_retailer_id=#listLast(retailer, '_')#</cfcase>
					</cfswitch>
				<cfelse>
					<cfswitch expression="#listFirst(retailer, '_')#">
						<cfcase value="people">OR people_retailer_id=#listLast(retailer, '_')#</cfcase>
						<cfcase value="company">OR company_retailer_id=#listLast(retailer, '_')#</cfcase>
					</cfswitch>
				</cfif>
			</cfloop>
			) AND		
		</cfif>
		
		<cfif isDefined("SESSION.conditionQuery.euro_size_min")>
			<cfset var euroSizeMin=#SESSION.conditionQuery.euro_size_min#>
			euro_size>=#euroSizeMin# AND 			
		</cfif>
		<cfif isDefined("SESSION.conditionQuery.euro_size_max")>
			<cfset var euroSizeMax=#SESSION.conditionQuery.euro_size_max#>
			euro_size<=#euroSizeMax# AND 			
		</cfif>
		<!--- Техническая часть, иначе запрос окончится на AND--->
		1=1
		
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
			<cfset var colname=structkeylist(gridchanged)> 
			<cfset var sentValue = structfind(gridchanged, #colname#)>
			<cfset var lastPartSentValue = listLast(sentValue, ' ')>
			<!---Если при изменении значения ячейки вместе с основной
			посылается служебная информация вида "id11" или "idc34", то ее для временной таблицы надо удалить.--->
			<cfif (Find('id', lastPartSentValue))>
				<cfset var newValue=listDeleteAt(sentValue, listlen((sentValue), ' '), ' ')>
			<cfelse>
				<cfset var newValue = sentValue>
			</cfif>
			
			<!--- Правим временнную таблицу --->
			<cfset var update_temp_table = "">
			<cfquery name="update_temp_table" datasource="bont">
				update itemtemp set #colname#='#newValue#'
				where itemtemp.id=#gridrow.id#
			</cfquery>
			<!--- Правим разные исходные (постоянные) таблицы, в зависимости от выбранного столбца во временной таблице --->
			<cfswitch expression="#colname#">
				<cfcase value="sold_for">
					<cfset var change_item_sold_for = "">
					<cfquery name="change_item_sold_for" datasource="bont">
						UPDATE item i set i.sold_for=#gridchanged.sold_for#
						WHERE i.id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="sale_date">
					<cfset var change_item_sale_date = "">
					<cfquery name="change_item_sale_date" datasource="bont">
						UPDATE item i set i.sale_date='#gridchanged.sale_date#'
						WHERE i.id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="i_note">
					<cfset var change_item_note = "">
					<cfquery name="change_item_note" datasource="bont">
						UPDATE item i set i.note='#gridchanged.i_note#'
						WHERE i.id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="i_pubnote">
					<cfset var change_item_pubnote = "">
					<cfquery name="change_item_pubnote" datasource="bont">
						UPDATE item i set i.pub_note='#gridchanged.i_pubnote#'
						WHERE i.id=#gridrow.id#
					</cfquery>
				</cfcase>
				
				<cfcase value="euro_size">
					<cfquery name="change_euro_size" datasource="bont">
							UPDATE cycling_shoe cs set cs.euro_size=#gridchanged.euro_size#
							WHERE cs.item_id=#gridrow.id#
					</cfquery>
					<!--- Разработка этого участка кода отложена
					<cfset var newEuroSize = newValue>
					<cfif gridrow.brand EQ "BONT" AND structKeyExists(APPLICATION.bontSizeRange, newEuroSize)>
						<cfset newBontSize = newEuroSize & "/" & structFind(APPLICATION.bontSizeRange, newEuroSize)>
						<cfset var change_euro_and_bont_size = "">
						<cfquery name="change_euro_and_bont_size" datasource="bont">
							UPDATE cycling_shoe cs set cs.euro_size=<cfoutput>#gridchanged.euro_size#</cfoutput>
							<cfoutput>, cs.bont_size='#newBontSize#'</cfoutput>
							WHERE cs.item_id=<cfoutput>#gridrow.id#</cfoutput>
						</cfquery>
						<cfset var change_bont_size_in_temp_table = "">
						<cfquery name="change_bont_size_in_temp_table" datasource="bont">
							UPDATE itemtemp it SET it.bont_size='<cfoutput>#newBontSize#</cfoutput>'
							WHERE it.id=<cfoutput>#gridrow.id#</cfoutput>
						</cfquery>
					<cfelse>
						<cfset var change_euro_size = "">
						<cfquery name="change_euro_size" datasource="bont">
							UPDATE cycling_shoe cs set cs.euro_size=<cfoutput>#gridchanged.euro_size#</cfoutput>
							WHERE cs.item_id=<cfoutput>#gridrow.id#</cfoutput>
						</cfquery>
					</cfif>
					---->
				</cfcase>
				<!--- Разработка этого участка кода отложена
				<cfcase value="bont_size">
					<cfset var change_bont_size = "">
					<cfquery name="change_bont_size" datasource="bont">
						UPDATE cycling_shoe cs set cs.bont_size='<cfoutput>#gridchanged.bont_size#</cfoutput>'
						WHERE cs.item_id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
					<cfset var new_euro_size = listFirst(gridchanged.bont_size, "/")>
					<cfset var change_euro_size_after_change_bont_size = "">
					<cfquery name="change_euro_size_after_change_bont_size" datasource="bont">
						UPDATE cycling_shoe cs set cs.euro_size=<cfoutput>#new_euro_size#</cfoutput>
						WHERE cs.item_id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
					<cfset var change_euro_size_in_temptable = "">
					<cfquery name="change_euro_size_in_temptable" datasource="bont">
						UPDATE itemtemp it set it.euro_size=<cfoutput>#new_euro_size#</cfoutput>
						WHERE it.id=<cfoutput>#gridrow.id#</cfoutput>
					</cfquery>
				</cfcase>
				---->
				<cfcase value="width">
					<cfset var change_last_width = "">
					<cfquery name="change_last_width" datasource="bont">
						UPDATE cycling_shoe cs set cs.last_width_id=(SELECT id FROM last_width lw WHERE lw.name_eng='#newValue#')
						WHERE cs.item_id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="color">
					<cfset var newColorNameEng = listFirst(newValue, ' ')>
					<cfset var change_color = "">
					<cfquery name="change_color" datasource="bont">
						UPDATE cycling_shoe cs set cs.color_id=(SELECT id FROM color clr WHERE clr.name_eng='#newColorNameEng#')
						WHERE cs.item_id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="model">
					<cfset var new_model_id = RemoveChars(lastPartSentValue, 1, 2)>
					<cfset var change_csm_id = "">
					<cfquery name="change_csm_id" datasource="bont">
						UPDATE item i set i.model_id=#new_model_id#
						WHERE i.id=#gridrow.id#
					</cfquery>
					<cfset var change_brand_in_temptable = "">
					<cfquery name="change_brand_in_temptable" datasource="bont">
						UPDATE itemtemp it set it.brand=(select b.name_eng from brand b WHERE b.id=(SELECT brand_id from item_model im WHERE im.id=#new_model_id#))
						WHERE it.id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="i_status">
					<cfset var change_status = "">
					<cfquery name="change_status" datasource="bont">
						UPDATE item i set i.status_id=(SELECT id FROM statuses WHERE statuses.name_rus='#newValue#')
						WHERE i.id=#gridrow.id#
					</cfquery>
				</cfcase>
				<cfcase value="retailer">
					<cfset var retailerTable=left(lastPartSentValue, 3)>
					<cfset var newRetailer_id=removeChars(lastPartSentValue, 1, 3)>
					<cfswitch expression="#retailerTable#">
						<!---Если таблица people---->
						<cfcase value="idp">
							<cfset var change_people_retailer = "">
							<cfquery name="change_people_retailer" datasource="bont">
								UPDATE item i set i.retailer_company_id=1, i.retailer_people_id=#newRetailer_id# WHERE i.id=#gridrow.id#
							</cfquery>
						</cfcase>
						<!---Если таблица company---->
						<cfcase value="idc">
							<cfset var change_company_retailer = "">
							<cfquery name="change_company_retailer" datasource="bont">
								UPDATE item i set i.retailer_people_id=1, i.retailer_company_id=#newRetailer_id# WHERE i.id=#gridrow.id#
							</cfquery>
						</cfcase>						
					</cfswitch>
				</cfcase>
				<cfcase value="buyer">
					<cfset var newBuyer_id=removeChars(lastPartSentValue, 1, 2)>
					<cfset var change_company_buyer = "">
					<cfquery name="change_company_buyer" datasource="bont">
						UPDATE item i set i.buyer_company_id=#newBuyer_id# WHERE i.id=#gridrow.id#
					</cfquery>
				</cfcase>
			</cfswitch>
		<cfelse>
			<!--- Если задействована кнопка delete --->
			<cfset var delete_row_from_temp_item = "">
			<cfquery name="delete_row_from_itemtemp" datasource="bont">
				DELETE FROM itemtemp where id=#gridrow.id#
			</cfquery>
			<!---Надо выяснить, из какой таблицы, кроме главной, надо удалить запись--->
			<cfset var select_pattern = "">
			<cfquery name="select_pattern" datasource="bont">
				SELECT p.pattern as p FROM
				item i JOIN item_model im ON i.model_id=im.id JOIN pattern p ON im.pattern_id=p.id
				WHERE i.id = #gridrow.id#
			</cfquery>
			<cfset var table = select_pattern.p>
			
			<cfset var delete_from_child_table = "">
			<cfquery name="delete_from_child_table" datasource="bont">
				DELETE FROM #table# WHERE #table#.item_id=#gridrow.id#
			</cfquery>
			
			<cfset var delete_from_parent_table = "">
			<cfquery name="delete_from_parent_table" datasource="bont">
				DELETE FROM item WHERE item.id = #gridrow.id#
			</cfquery>
		</cfif>
	</cfif>
	
</cffunction>

</cfcomponent>