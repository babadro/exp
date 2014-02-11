<cfparam name="attributes.orderID" type="numeric">

<cfquery name="getOrder">
	SELECT
	c.ContactID, c.FirstName, c.LastName, c.Email,
	o.OrderDate, o.ShipAddress, o.ShipCountry,
	oi.OrderQty, oi.ItemPrice,
	m.Merchname,
	F.MovieTitle
	FROM
	Contacts c,
	MerchandiseOrders o, 
	MerchandiseOrdersItems oi,
	Merchandise m,
	Films f
	WHERE o.OrderID = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.orderID#">
	AND c.ContectID = o.ContectID
	AND m.MerchID = oi.ItemID
	AND o.OrderID = oi.OrderID
	AND f.FilmID = m.FilmID
	ORDER BY m.MerchName
</cfquery>

<cfquery dbtype="query" name="getTotal">
	SELECT SUM(ItemPrice * OrderQty) AS OrderTotal FROM GetORder
</cfquery>

<cfprocessingdirective suppressWhitespace="no">
	<cfmail query="getOrder" group="ContactID" groupCasesensitive="no" startrow="1"
	subject="Thanks for your order (Order number #Attributes.orderID#)"
	to="""#FirstName# #LastName#"" <#Email#>"
	from="""Orange Whip Online Store"" <orders@orangeshipstudios.com>">
	
										
	</cfmail>
	
	
</cfprocessingdirective>