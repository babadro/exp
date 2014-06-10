<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function errorhandler(id,message) {
alert("Error while updating\n Error code: "+id+"\n Message: "+message);
}
</script>
</head>
<body>

<cfinclude template="queryFunctions.cfm">


<cfif not isDefined("SESSION.conditionQuery")><cfset SESSION.conditionQuery = structNew()></cfif>
<cfif isDefined("FORM.clearConditionQuery")><cfset structClear(SESSION.conditionQuery)></cfif>

<cfif isDefined("FORM.brand")><cfset SESSION.conditionQuery.brand_id = FORM.brand></cfif>
<cfif isDefined("FORM.model")><cfset SESSION.conditionQuery.model_id = FORM.model></cfif>
<cfif isDefined("FORM.cleat_type")><cfset SESSION.conditionQuery.cleat_type_id = FORM.cleat_type></cfif>
<cfif isDefined("FORM.euroSizeMin")><cfset SESSION.conditionQuery.euro_size_min = FORM.euroSizeMin></cfif>
<cfif isDefined("FORM.euroSizeMax")><cfset SESSION.conditionQuery.euro_size_max = FORM.euroSizeMax></cfif>
<cfif isDefined("FORM.lastWidth")><cfset SESSION.conditionQuery.last_width_id = FORM.lastWidth></cfif>
<cfif isDefined("FORM.color")><cfset SESSION.conditionQuery.color_id = FORM.color></cfif>
<cfif isDefined("FORM.consignmentStatus")><cfset SESSION.conditionQuery.consignment_status_id = FORM.consignmentStatus></cfif>
<cfif isDefined("FORM.itemStatus")><cfset SESSION.conditionQuery.item_status_id = FORM.itemStatus></cfif>
<cfif isDefined("FORM.retailer")><cfset SESSION.conditionQuery.retailer_data = FORM.retailer></cfif>

<!---
<cfif isDefined("FORM.cleat_type")><cfset SESSION.conditionQuery.cleat_type_id = FORM.cleat_type></cfif>

<cfset SESSION.conditionQuery.brand_id = "">
<cfset SESSION.conditionQuery.model_id = "">
<cfset SESSION.conditionQuery.cleat_type_id = "">
<cfset SESSION.conditionQuery.euroSizeMin = ""> 
<cfset SESSION.conditionQuery.EuroSizeMax = "">
---->
<cfif isDefined("SESSION.conditionQuery.model_id")>
	<cfoutput>model_id=#SESSION.conditionQuery.model_id# </cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.brand_id")>
	<cfoutput>brand_id=#SESSION.conditionQuery.brand_id# </cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.cleat_type_id")>
	<cfoutput>cleat_type_id=#SESSION.conditionQuery.cleat_type_id# </cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.euro_size_min")>
	<cfoutput>euroSizeMin=#SESSION.conditionQuery.euro_size_min# </cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.euro_size_max")>
	<cfoutput>euroSizeMax=#SESSION.conditionQuery.euro_size_max# </cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.last_width_id")>
	<cfoutput>last_width_id=#SESSION.conditionQuery.last_width_id#</cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.color_id")>
	<cfoutput>color_id=#SESSION.conditionQuery.color_id#</cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.consignment_status_id")>
	<cfoutput>consignment_status_id=#SESSION.conditionQuery.consignment_status_id#</cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.item_status_id")>
	<cfoutput>item_status_id=#SESSION.conditionQuery.item_status_id#</cfoutput>  
</cfif>
<cfif isDefined("SESSION.conditionQuery.retailer_data")>
	<cfoutput>retailer_data=#SESSION.conditionQuery.retailer_data#</cfoutput>  
</cfif>

<cfform name="form01">
	
	<table align="left">
		<tr><td>Бренд</td><td><cfselect name="brand" query="getBrand"  value="id" display="name_eng" multiple="yes" /></td></tr>
		<tr><td>Модель</td><td><cfselect name="model" query="getModel"  value="mod_id" display="model_name" multiple="yes" /></td></tr>
		<tr><td>Тип шипа</td><td><cfselect name="cleat_type" query="getCleatType" value="id" display="name_eng" multiple="yes"/></td></tr>
		<tr><td>Размер от</td><td><cfselect name="euroSizeMin" query="getEuroSizeRange"  value="euro_size" /></td></tr>
		<tr><td>Размер до</td><td><cfselect name="euroSizeMax" query="getEuroSizeRange"  value="euro_size" selected="50.0" /></td></tr>
		<tr><td>Ширина колодки</td><td><cfselect name="lastWidth" query="getLastWidth"  value="id" display="name_eng" multiple="yes"/></td></tr>
		<tr><td>Цвет</td><td><cfselect name="color" query="getColor"  value="id" display="name_eng" multiple="yes"/></td></tr>
		<tr><td>Статус поставки,<br>в которой шел товар</td><td><cfselect name="consignmentStatus" query="getConsignmentStatus"  value="id" display="name_rus" multiple="yes" /></td></tr>
		<tr><td>Статус товара</td><td><cfselect name="itemStatus" query="getItemStatus"  value="id" display="name_rus" multiple="yes" /></td></tr>
		<tr><td>Где находится</td><td><cfselect name="retailer" query="getRetailer"  value="id" display="retailer" multiple="yes" /></td></tr>
		<tr><td><input type="submit" value="сделать выборку"></td></tr>
		<tr><td><cfinput type="reset" name="resetForm" value="очистить форму"></td></tr>
		<tr><td><cfinput type="submit" name="clearConditionQuery" value="Сбросить условия запроса"></td></tr>
	</table>
	
	<cfgrid format="html" name="grid01" pagesize=40 
	stripeRowColor="gray"
	bind="cfc:places.getData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
	delete="yes" selectmode="edit"
	onchange="cfc:places.editData({cfgridaction},{cfgridrow},{cfgridchanged})">
		
		<cfgridcolumn name="id" display=true header="id" select="no"/>
		<cfgridcolumn name="sold_for" display=false header="цена продажи" type="numeric"/>
		<cfgridcolumn name="sale_date" display=false header="дата продажи" type="date"/>
		<cfgridcolumn name="i_note" display=false header="примечание к товару"/>
		<cfgridcolumn name="i_pubnote" display=false header="публичное примечание к товару"/>
		<cfgridcolumn name="brand" display=false header="бренд" select="no"/>
		<cfgridcolumn name="rub" display=true header="цена в рублях" select="no"/>
		<cfgridcolumn name="usd" display=false header="цена в долларах" select="no"/>
		<cfgridcolumn name="euro_size" display=true header="размер euro" type="numeric"/>
		<!---
		<cfgridcolumn name="bont_size" display=true header="размер bont" values=#StructStringToList(APPLICATION.bontSizeRange)# valuesdisplay=#StructStringToList(APPLICATION.bontSizeRange)#/>
		---->
		<cfgridcolumn name="last_len" display=false header="длина" type="numeric"/>
		<cfgridcolumn name="width" display=true header="ширина" type="combobox" values="#lastWidthNames()#" valuesdisplay="#lastWidthNames()#"/>
		<cfgridcolumn name="color" display=true header="цвет" values=#colorNames()# valuesdisplay=#colorNames()# />
		<cfgridcolumn name="model" display=true header="модель" values=#getCyclingShoeModelName()# valuesdisplay=#getCyclingShoeModelName()#/>
		<cfgridcolumn name="weight" display=false header="вес" type="numeric" />
		<cfgridcolumn name="upper_material" display=false header="материал верха" select="no"/>
		<cfgridcolumn name="invoice" display=false header="инвойс поставки" select="no" />
		<cfgridcolumn name="fact_arrival" display=false header="фактическое прибытие поставки" select="no"/>
		<cfgridcolumn name="expect_arrival" display=false header="ожидаемое прибытие поставки" select="no"/>
		<cfgridcolumn name="cons_note" display=false header="примечание к поставке" select="no"/>
		<cfgridcolumn name="cons_status" display=false header="статус поставки" select="no"/>
		<cfgridcolumn name="i_status" display=false header="статус товара" values="#statusNames()#" valuesdisplay="#statusNames()#"/>
		<cfgridcolumn name="retailer" display=true header="Где находится" values="#retailerNames()#"/>
		<cfgridcolumn name="buyer" display=false header="покупатель" values="#buyerNames()#" valuesdisplay="#buyerNames()#"/>
	</cfgrid>
</cfform>


</body>
</html>