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
	<cfquery name="get_cycling_shoe_model" dataSource="bont">SELECT concat(csm.name_eng, ' ', IF(!csm.note, csm.note, ''), '�', csm.item_model_id) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_cycling_shoe_model.model_name)>
</cffunction>

<cffunction name="getCSMid">
	<cfset var get_csm_id = "">
	<cfquery name="get_csm_id" dataSource="bont">SELECT concat(csm.item_model_id, ' ', csm.name_eng, ' ', IF(!csm.note, csm.note, '')) AS model_name FROM cycling_shoe_model csm ORDER BY csm.name_eng</cfquery>
	<cfreturn valueList(get_csm_id.mod_id)>
</cffunction>
<cfoutput>#getCyclingShoeModelName()#<br></cfoutput>
<cfset gridchanged1 = structNew() >
<cfset gridchanged1.model = "vaypor leather �6">
<cfoutput>#RemoveChars((listLast(gridchanged1.model, ' ')), 1, 1)#</cfoutput>
<cfform name="form01">
<cfgrid format="html" name="grid01" pagesize=40
stripeRows=true stripeRowColor="gray"
bind="cfc:places.getData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
delete="yes" selectmode="edit"
onchange="cfc:places.editData({cfgridaction},{cfgridrow},{cfgridchanged})">
	
<cfgridcolumn name="id" display=true header="id"/>
<cfgridcolumn name="sold_for" display=true header="���� �������"/>
<cfgridcolumn name="sale_date" display=true header="���� �������"/>
<cfgridcolumn name="i_note" display=true header="���������� � ������"/>
<cfgridcolumn name="i_pubnote" display=true header="��������� ���������� � ������"/>
<cfgridcolumn name="brand" display=true header="�����"/>
<cfgridcolumn name="rub" display=true header="���� � ������"/>
<cfgridcolumn name="usd" display=true header="���� � ��������"/>
<cfgridcolumn name="euro_size" display=true header="������ euro"/>
<cfgridcolumn name="bont_size" display=true header="������ bont"/>
<cfgridcolumn name="last_len" display=true header="�����"/>
<cfgridcolumn name="width" display=true header="������"/>
<cfgridcolumn name="encolor" display=true header="���� ����"/>
<cfgridcolumn name="ruscolor" display=true header="����"/>
<cfgridcolumn name="model" display=true header="������" values=#getCyclingShoeModelName()# valuesdisplay=#getCyclingShoeModelName()#/>
<cfgridcolumn name="weight" display=true header="���"/>
<cfgridcolumn name="upper_material" display=true header="�������� �����"/>
<cfgridcolumn name="invoice" display=true header="������ ��������"/>
<cfgridcolumn name="fact_arrival" display=true header="����������� �������� ��������"/>
<cfgridcolumn name="expect_arrival" display=true header="��������� �������� ��������"/>
<cfgridcolumn name="cons_note" display=true header="���������� � ��������"/>
<cfgridcolumn name="cons_status" display=true header="������ ��������"/>
<cfgridcolumn name="i_status" display=true header="������ ������"/>
<cfgridcolumn name="retailer" display=true header="��� ���������"/>
<cfgridcolumn name="buyer" display=true header="����������"/>
<!---
<cfgridcolumn name="Email" display=true header="Email" values="a@mail.ru,b@mail.ru,c@yandex.ru" valuesdisplay="a,b,c"/>
--->
</cfgrid>


</cfform>


</body>
</html>