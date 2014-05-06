<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function errorhandler(id,message) {
alert("Error while updating\n Error code: "+id+"\n Message: "+message);
}
</script>
</head>
<body>
	
<cffunction name="getCyclingShoeModelName">
	<cfset var get_cycling_shoe_model = "">
	<cfquery name="get_cycling_shoe_model" dataSource="bont">SELECT concat(csm.name_eng, ' ', IF(!csm.note, concat(csm.note, ' '), ''), 'id', csm.item_model_id) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_cycling_shoe_model.model_name)>
</cffunction>

<cffunction name="lastWidthNames">
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

<cffunction name="newfunc"></cffunction>

<!--- функция пока не нужна
<cffunction name="getCSMid">
	<cfset var get_csm_id = "">
	<cfquery name="get_csm_id" dataSource="bont">SELECT concat(csm.item_model_id, ' ', csm.name_eng, ' ', IF(!csm.note, csm.note, '')) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_csm_id.mod_id)>
</cffunction>
---->

<cfoutput>#getCyclingShoeModelName()#<br></cfoutput>
<cfset gridchanged1 = structNew() >
<cfset gridchanged1.model = "vaypor leather №6">
<cfoutput>#RemoveChars((listLast(gridchanged1.model, ' ')), 1, 1)#</cfoutput>

<cfform name="form01">
	<cfgrid format="html" name="grid01" pagesize=40 
	stripeRows=true stripeRowColor="gray"
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
		<cfgridcolumn name="euro_size" display=true header="размер euro"/>
		<cfgridcolumn name="bont_size" display=true header="размер bont"
			values="36/3.5,37/4.5,38/5,39/6,40/6.5,40.5/7,41/7.5,42/8,43/9,44/10,44.5/10.5,45/10.75,46/11,46.5/11.5,47/12,48/12.5,49/13,50/14"
			valuesdisplay="36/3.5,37/4.5,38/5,39/6,40/6.5,40.5/7,41/7.5,42/8,43/9,44/10,44.5/10.5,45/10.75,46/11,46.5/11.5,47/12,48/12.5,49/13,50/14"/>
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
		<cfgridcolumn name="i_status" display=true header="статус товара" values="#statusNames()#,' '" valuesdisplay="#statusNames()#,без статуса"/>
		<cfgridcolumn name="retailer" display=true header="Где находится"/>
		<cfgridcolumn name="buyer" display=true header="покупатель"/>
		<!---
		<cfgridcolumn name="Email" display=true header="Email" values="a@mail.ru,b@mail.ru,c@yandex.ru" valuesdisplay="a,b,c"/>
		--->
	</cfgrid>


</cfform>


</body>
</html>