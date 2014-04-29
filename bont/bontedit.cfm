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
	<cfquery name="get_cycling_shoe_model" dataSource="bont">SELECT concat(csm.item_model_id, ' ', csm.name_eng, ' ', IF(!csm.note, csm.note, '')) AS model FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_cycling_shoe_model.model)>
	
</cffunction>

<cffunction name="getCSMid">
	<cfset var getCSMid = "">
	<cfquery name="get_csm_id" dataSource="bont">SELECT csm.item_model_id as model_id FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_csm_id.model_id)>
</cffunction>
<cfoutput>#getCyclingShoeModelName()#<br></cfoutput>
<cfoutput>#getCSMid()#</cfoutput>

<cfform name="form01">
<cfgrid format="html" name="grid01" pagesize=40
stripeRows=true stripeRowColor="gray"
bind="cfc:places.getData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
delete="yes" selectmode="edit"
onchange="cfc:places.editData({cfgridaction},{cfgridrow},{cfgridchanged})">
	
<cfgridcolumn name="id" display=true header="id"/>
<cfgridcolumn name="model" display=true header="модель" values=#getCyclingShoeModelName()# valuesdisplay=#getCyclingShoeModelName()#/>
<cfgridcolumn name="sold_for" display=true header="цена продажи"/>
<cfgridcolumn name="retailer_company" display=true header="Магазин"/>
<cfgridcolumn name="retailer_fname" display=true header="Имя продавца"/>
<cfgridcolumn name="retailer_sname" display=true header="фамилия продавца"/>
<cfgridcolumn name="size" display=true header="размер"/>
<cfgridcolumn name="color" display=true header="цвет"/>
<cfgridcolumn name="last_width" display=true header="ширина"/>
<cfgridcolumn name="status" display=true header="статус"/>
<!---
<cfgridcolumn name="Email" display=true header="Email" values="a@mail.ru,b@mail.ru,c@yandex.ru" valuesdisplay="a,b,c"/>
--->
</cfgrid>


</cfform>


</body>
</html>