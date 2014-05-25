<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function errorhandler(id,message) {
alert("Error while updating\n Error code: "+id+"\n Message: "+message);
}
</script>
</head>
<body>

<!---
<cffunction name="StructStringToList" description="Convert struct (with key = string and value = string) to list look like 'key1/value1,key2/value2 and so on...'" returntype="String">
	<cfargument name="originStruct" required="true">
		
	<cfset var arr = arrayNew(1)>
	
	<cfloop collection=#originStruct# item="i">
		<cfset var element = i & "/" & originStruct[i]>
		<cfset ArrayAppend(arr, element)>
	</cfloop>
	
	<cfset arraySort(arr, "textnocase", "asc")>
	<cfset var resultList = arrayToList(arr, ",")>
	
	<cfreturn resultList>
</cffunction>
---->
<cffunction name="getCyclingShoeModelName">
	<cfset var get_cycling_shoe_model = "">
	<cfquery name="get_cycling_shoe_model" dataSource="bont">SELECT concat(csm.name_eng, ' ', IF(!csm.note, concat(csm.note, ' '), ''), 'id', csm.item_model_id) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_cycling_shoe_model.model_name)>
</cffunction>

<cffunction name="lastWidthNames">
	<cfset var get_last_width_name = "">
	<cfset var get_last_width_name = "">
	<cfquery name="get_last_width_name" dataSource="bont">SELECT lw.name_eng AS last_width_name FROM last_width lw ORDER BY lw.name_eng DESC</cfquery>
	<cfreturn valueList(get_last_width_name.last_width_name)>
</cffunction>

<cffunction name="colorNames">
	<cfset var get_color_name = "">
	<cfquery name="get_color_name" dataSource="bont">SELECT concat(clr.name_eng, ' ', clr.name_rus) as colorname FROM color clr</cfquery>
	<cfreturn valueList(get_color_name.colorname)>
</cffunction>

<cffunction name="statusNames">
	<cfset var get_status_name = "">
	<!---Выбираем только те статусы, которые применяются для единиц товаров--->
	<cfquery name="get_status_name" dataSource="bont">SELECT s.name_rus as statusname FROM statuses s WHERE s.item=b'1'</cfquery>
	<cfreturn valueList(get_status_name.statusname)>
</cffunction>


	
<cffunction name="retailerNames">
	<cfquery name="get_retailer_name" dataSource="bont">
		SELECT CONCAT(
		  IF((!p.fname_rus OR p.fname_rus!=''), concat(p.fname_rus, ' '), ''),
		  IF((!p.sname_rus OR p.sname_rus!=''), concat(p.sname_rus, ' '), ''),
		  CONCAT('idp', id)
		  )
		 	AS retailer
  			FROM people p WHERE p.store=b'1' AND p.id!=1
 		UNION
		SELECT CONCAT(
		  IF((!c.name_rus OR c.name_rus!=''), CONCAT(c.name_rus, ' '), ''),
		  CONCAT('idc', id)
		  )
			FROM company c WHERE c.store=b'1' AND c.id!=1;
	</cfquery>
	<cfreturn valueList(get_retailer_name.retailer)>
</cffunction>

<cffunction name="buyerNames">
	<cfset var get_buyer_name = "">
	<cfquery name="get_buyer_name" datasource="bont">
		SELECT CONCAT(
		  IF(c.id=1, "другой", c.name_rus),' ', 'id', id
		  ) AS buyer
  		FROM company c ORDER BY c.name_rus;
	</cfquery>
	<cfreturn valueList(get_buyer_name.buyer)>
</cffunction>

<!---

<cffunction name="getCSMid" description="get list of id's for each cycling shoe model">
	<cfset var get_csm_id = "">
	<cfquery name="get_csm_id" dataSource="bont">SELECT item_model_id as mod_id FROM cycling_shoe_model;</cfquery>
	<cfreturn valueList(get_csm_id.mod_id)>
</cffunction>

<cffunction name="getColorId" description="get list of id's for each color">
	<cfset var get_color_id = "">
	<cfquery name="get_color_id" dataSource="bont">SELECT color.id as id FROM color</cfquery>
	<cfreturn valueList(get_color_id.id)>
</cffunction>

<cffunction name="getConsignmentStatusId" description="get list of id's for each color">
	<cfset var get_color_id = "">
	<cfquery name="get_color_id" dataSource="bont">SELECT s.id as id, name_rus from statuses s WHERE s.consignment=b'1'</cfquery>
	<cfreturn valueList(get_color_id.id)>
</cffunction>
---->


<cfquery name="getModel" datasource="bont">
	SELECT concat(csm.name_eng, IF(!csm.note, concat(' ', csm.note), '')) AS model_name, item_model_id as mod_id FROM cycling_shoe_model csm ORDER BY csm.name_eng
</cfquery>
<cfquery name="getBrand" datasource="bont">SELECT brand.id, brand.name_eng as name_eng FROM brand</cfquery>
<cfquery name="getEuroSizeRange" datasource="bont">SELECT sm.euro_size FROM size_map sm</cfquery>
<cfquery name="getCleatType" datasource="bont">SELECT ct.id as id, name_eng from cleat_type ct where id!=1</cfquery>
<cfquery name="getLastWidth" datasource="bont">SELECT lw.id as id, name_eng from last_width lw where id!=5</cfquery>
<cfquery name="getColor" datasource="bont">SELECT clr.id as id, name_eng from color as clr</cfquery>
<cfquery name="getConsignmentStatus" datasource="bont">SELECT s.id as id, name_rus from statuses s WHERE s.consignment=b'1' AND id!=1</cfquery>
<cfquery name="getItemStatus" datasource="bont">SELECT s.id as id, name_rus from statuses s WHERE s.item=b'1'</cfquery>
<cfquery name="getPlace" datasource="bont">SELECT lw.id as id, name_eng from last_width lw where id!=5</cfquery>

<cfform style="float:left">
	<table align="left">
		<tr><td>Бренд</td><td><cfselect name="brand" query="getBrand"  value="id" display="name_eng" multiple="yes" /></td></tr>
		<tr><td>Модель</td><td><cfselect name="model" query="getModel"  value="mod_id" display="model_name" multiple="yes" /></td></tr>
		<tr><td>Тип шипа</td><td><cfselect name="cleat_type" query="getCleatType" value="id" display="name_eng" multiple="yes"/></td></tr>
		<tr><td>Размер от</td><td><cfselect name="euroSizeMin" query="getEuroSizeRange"  value="euro_size" /></td></tr>
		<tr><td>Размер до</td><td><cfselect name="euroSizeMin" query="getEuroSizeRange"  value="euro_size" selected="50.0" /></td></tr>
		<tr><td>Ширина колодки</td><td><cfselect name="lastWidth" query="getLastWidth"  value="id" display="name_eng" multiple="yes"/></td></tr>
		<tr><td>Цвет</td><td><cfselect name="color" query="getColor"  value="id" display="name_eng" multiple="yes"/></td></tr>
		<tr><td>Статус поставки,<br>в которой шел товар</td><td><cfselect name="consignmentStatus" query="getConsignmentStatus"  value="id" display="name_rus" multiple="yes" /></td></tr>
		<tr><td>Статус товара</td><td><cfselect name="itemStatus" query="getItemStatus"  value="id" display="name_rus" multiple="yes" /></td></tr>
		<tr><td>Где находится</td><td><cfselect name="retailer" query="getRetailerName"  value="getRetailerName" display="name_rus" multiple="yes" /></td></tr>
	</table>
</cfform>

<cfform name="form01">
	
	<cfgrid format="html" name="grid01" pagesize=40 
	stripeRowColor="gray"
	bind="cfc:places.getData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
	delete="yes" selectmode="edit"
	onchange="cfc:places.editData({cfgridaction},{cfgridrow},{cfgridchanged})">
		
		<cfgridcolumn name="id" display=true header="id" select="no"/>
		<cfgridcolumn name="sold_for" display=true header="цена продажи" type="numeric"/>
		<cfgridcolumn name="sale_date" display=true header="дата продажи" type="date"/>
		<cfgridcolumn name="i_note" display=true header="примечание к товару"/>
		<cfgridcolumn name="i_pubnote" display=true header="публичное примечание к товару"/>
		<cfgridcolumn name="brand" display=true header="бренд" select="no"/>
		<cfgridcolumn name="rub" display=true header="цена в рублях" select="no"/>
		<cfgridcolumn name="usd" display=true header="цена в долларах" select="no"/>
		<cfgridcolumn name="euro_size" display=true header="размер euro" type="numeric"/>
		<!---
		<cfgridcolumn name="bont_size" display=true header="размер bont" values=#StructStringToList(APPLICATION.bontSizeRange)# valuesdisplay=#StructStringToList(APPLICATION.bontSizeRange)#/>
		---->
		<cfgridcolumn name="last_len" display=true header="длина" type="numeric"/>
		<cfgridcolumn name="width" display=true header="ширина" type="combobox" values="#lastWidthNames()#" valuesdisplay="#lastWidthNames()#"/>
		<cfgridcolumn name="color" display=true header="цвет" values=#colorNames()# valuesdisplay=#colorNames()# />
		<cfgridcolumn name="model" display=true header="модель" values=#getCyclingShoeModelName()# valuesdisplay=#getCyclingShoeModelName()#/>
		<cfgridcolumn name="weight" display=true header="вес" type="numeric" />
		<cfgridcolumn name="upper_material" display=true header="материал верха" select="no"/>
		<cfgridcolumn name="invoice" display=true header="инвойс поставки" select="no" />
		<cfgridcolumn name="fact_arrival" display=true header="фактическое прибытие поставки" select="no"/>
		<cfgridcolumn name="expect_arrival" display=true header="ожидаемое прибытие поставки" select="no"/>
		<cfgridcolumn name="cons_note" display=true header="примечание к поставке" select="no"/>
		<cfgridcolumn name="cons_status" display=true header="статус поставки" select="no"/>
		<cfgridcolumn name="i_status" display=true header="статус товара" values="#statusNames()#" valuesdisplay="#statusNames()#"/>
		<cfgridcolumn name="retailer" display=true header="Где находится" values="#retailerNames()#"/>
		<cfgridcolumn name="buyer" display=true header="покупатель" values="#buyerNames()#" valuesdisplay="#buyerNames()#"/>
		
	</cfgrid>


</cfform>


</body>
</html>