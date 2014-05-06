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
	<cfquery name="get_cycling_shoe_model" dataSource="bont">SELECT concat(csm.name_eng, ' ', IF(!csm.note, csm.note, ''), '№', csm.item_model_id) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_cycling_shoe_model.model_name)>
</cffunction>

<cffunction name="getCSMid">
	<cfset var get_csm_id = "">
	<cfquery name="get_csm_id" dataSource="bont">SELECT concat(csm.item_model_id, ' ', csm.name_eng, ' ', IF(!csm.note, csm.note, '')) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_csm_id.mod_id)>
</cffunction>
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
<cfgridcolumn name="rub" display=true header="цена в рублях"/>
<cfgridcolumn name="usd" display=true header="цена в долларах"/>
<cfgridcolumn name="euro_size" display=true header="размер euro"/>
<cfgridcolumn name="bont_size" display=true header="размер bont"/>
<cfgridcolumn name="last_len" display=true header="длина"/>
<cfgridcolumn name="width" display=true header="ширина"/>
<cfgridcolumn name="encolor" display=true header="цвет англ"/>
<cfgridcolumn name="ruscolor" display=true header="цвет"/>
<cfgridcolumn name="model" display=true header="модель" values=#getCyclingShoeModelName()# valuesdisplay=#getCyclingShoeModelName()#/>
<cfgridcolumn name="weight" display=true header="вес"/>
<cfgridcolumn name="upper_material" display=true header="материал верха"/>
<cfgridcolumn name="invoice" display=true header="инвойс поставки"/>
<cfgridcolumn name="fact_arrival" display=true header="фактическое прибытие поставки"/>
<cfgridcolumn name="expect_arrival" display=true header="ожидаемое прибытие поставки"/>
<cfgridcolumn name="cons_note" display=true header="примечание к поставке"/>
<cfgridcolumn name="cons_status" display=true header="статус поставки"/>
<cfgridcolumn name="i_status" display=true header="статус товара"/>
<cfgridcolumn name="retailer" display=true header="Где находится"/>
<cfgridcolumn name="buyer" display=true header="покупатель"/>
<!---
<cfgridcolumn name="Email" display=true header="Email" values="a@mail.ru,b@mail.ru,c@yandex.ru" valuesdisplay="a,b,c"/>
--->
</cfgrid>


</cfform>


</body>
</html>