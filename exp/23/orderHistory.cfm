<cfquery name="getOrders" datasource="#application.dataSource#">
	SELECT OrderID, OrderDate,
	(SELECT Count(*)
	FROM MerchandiseOrdersItems oi
	WHERE oi.OrderID = o.OrderID) AS ItemCount
	FROM MerchandiseOrders o
	WHERE ContactID = #SESSION.auth.contactID#
	ORDER BY OrderDate DESC
</cfquery>

<cfset showDetail = isDefined("URL.orderID") and isNumeric(URL.orderID)>

<cfif showDetail>
	<cfquery name="getDetail" datasource="#APPLICATION.dataSource#">
		SELECT m.MerchName, oi.ItemPrice, oi.OrderQty
		FROM Merchandise m, MerchandiseOrdersItems oi
		WHERE m.MerchID = oi.ItemID
		AND oi.OrderID = #URL.orderID#
		AND oi.OrderID in (SELECT o.OrderID FROM MerchandiseOrders o
		WHERE o.ContactID = #SESSION.auth.contacgID#)
	</cfquery>

<cfif getDetail.recordCount eq 0>	<cfset showDetail = False>	</cfif>

</cfif>

<html>
<head>
 <title>Your Order History</title>
 <style type="text/css">
	BODY { font-family:sans-serif;font-size:12px;color:navy} 
	H2 { font-size:20px} 
	TH { font-family:sans-serif;font-size:12px;color:white;
	background:MediumBlue;text-align:left} 
	TD { font-family:sans-serif;font-size:12px} 
 </style>
</head>
<body>
	
<cfoutput>
	<h2>Your Order History</h2>
	<p><strong>Welcome back, #Session.auth.firstName#!</strong></p>
	<p>You have placed <strong>#getOrders.recordCount#</strong> orders with us to date</p>
</cfoutput>

<table border="1" width="300" cellpadding="5" cellspacing="2">
	<tr>
		<th>Date Ordered</th>
		<th>Items</th>
	</tr>
	
	<cfoutput query="getOrders">
		<cfset isExpanded = showDetail and (getOrders.OrderId eq URL.orderID)>
		<cfset arrowIcon = iif(isExpanded, "'ArrowDown.gif'", "'ArrowRight.gif'")>
		<tr>
			<td>
				<a href="OrderHistory2.cfm?OrderID=#orderID#">
				<img src="../images/#ArrowIcon#" width="16" height="16" border="0">
				#dateFormat(orderDate, "mmmm d, yyyy")#
				</a>
			</td>
			<td><strong>#itemCount#</strong></td>
		</tr>
		<cfif isExpanded>
			<cfset orderTotal = 0>
			<tr>
				<td colspan="2">
					<table width="100%" cellspacing="0" border="0">
						<tr>
							<th>Item</th><th>Qty</th><th>Price</th>
						</tr>
						<cfloop query="getDetail">
							<cfset orderTotal = orderTotal + itemPrice>
							<tr>
								<td>#merchName#</td>
								<td>#orderQty#</td>
								<td>#dollarFormat(itemPrice)#</td>
							</tr>
						</cfloop>
						<tr>
							<td colspan="2"><b>Total:</b></td>
							<td><strong>#dollarFormat(orderTotal)#</strong></td>
						</tr>
					</table>
				</td>
			</tr>
		</cfif>
	</cfoutput>	
</table>
	
</body>
</html>