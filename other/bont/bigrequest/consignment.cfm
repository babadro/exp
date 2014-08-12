<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function errorhandler(id,message) {
alert("Error while updating\n Error code: "+id+"\n Message: "+message);
}
</script>
</head>
<body>
<cfform name="form02">
	<cfgrid name="consignmentTable"
        format="html"
        pagesize="10"
        striperows="yes"
        bind="cfc:consignment.getData({cfgridpage},
                                {cfgridpagesize},
                                {cfgridsortcolumn},
                                {cfgridsortdirection})">
		
		<cfgridcolumn name="id" display=true header="id" select="no"/>
		<cfgridcolumn name="invoice" display=true header="инвойс"/>
		<cfgridcolumn name="expect_arrival" display=true header="ожидаемое прибытие" type="date"/>
		<cfgridcolumn name="fact_arrival" display=true header="фактическое прибытие" type="date"/>
		<cfgridcolumn name="status_name" display=true header="статус"/>
		<cfgridcolumn name="note" display=true header="примечание"/>
		<cfgridcolumn name="item_quantity" display=true header="единиц товаров" select="no"/>
	</cfgrid>
</cfform>
</body>
</html>