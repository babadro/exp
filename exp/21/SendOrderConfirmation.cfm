<cfparam name = "attributes.orderID" type = "numeric">

<cfquery name = "getOrder">
	SELECT
	c.ContactID, c.FirstName, c.LastName, c.Email,
	o.OrderDate, o.ShipAddress, o.ShipCity,
	o.ShipState, o.ShipZip, o.ShipCountry,
	oi.OrderQty, oi.ItemPrice,
	m.Merchname,
	f.MovieTitle
	FROM
	Contacts c,
	MerchandiseOrdersItems oi,
	Merchandaise m,
	Films f
	WHERE
	o.OrderID = 
	<cfqueryparam cfsqltype = "cf_sql_integer" value = "#attributes.orderID#">
	AND c.ContactID = o.ContactID
	AND m.MerchID = oi.ItemID
	AND o.OrderID = oi.OrderID
	AND f.FilmID = m.FilmID
	ORDER BY
	m.MerchName
</cfquery>

<cfprocessingdirective suppressWhitespace = "no">
	<cfmail query = "getOrder" group = "ContactID" groupCasesensitive = "no"
	startrow = "1" subject = "Thanks for your order (Order number #ATTRIBUTES.orderID#)"
	to = """#FirstName# #LastName#"" <#Email#>"
	from = """Orange Whip Online Store"" <orders@orangewhipstudios.com>"
	>Thank you for ordeig from Orange Whip Studios.
	Here are the details of your order, which will ship shortly.
	Please save or print this email for your records.
	
	Order Number: #attribtes.orderID#
	Items Ordered: #recordCount#
	Date of Order: #dateFormat(OrderDate, "dddd, mmm d, yyyy")#
	#timeFormat(OrderDate)#
	--------------------------
	<cfoutput>
</cfprocessingdirective>