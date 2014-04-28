<cfform>
	<cfgrid name="movieGrid" width="1280" format="html" pagesize="10" striperows="yes"
	bind="cfc:movies.browse({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})">
		<cfgridcolumn name="buyer_company_id" display="yes">
		<cfgridcolumn name="buyer_people_id">
		<cfgridcolumn name="consignment_id">
	</cfgrid>
</cfform>
