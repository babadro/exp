<!--- 
 Filename: OrderHistory4.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Displays a user's order history
--->

<html>
<head>
 <title>Order History</title>
 
 <!--- Apply some simple CSS style formatting --->
 <style type="text/css">
 BODY {font-family:sans-serif;font-size:12px;color:navy}
 H2 {font-size:20px}
 TH {font-family:sans-serif;font-size:12px;color:white;
 background:MediumBlue;text-align:left}
 TD {font-family:sans-serif;font-size:12px}
 </style> 
</head>
<body>

<cfset contactID = listFirst(getAuthUser())>
<cfset contactName = listRest(getAuthUser())>

<cfif isUserInRole("Admin")>
	<cfparam name="SESSION.orderHistorySelectedUser" default="#contactID#">
	<cfif isDefined("FORM.selectedUser")>	<cfset SESSION.orderHistorySelectedUser = FORM.selectedUser>	</cfif>
	<cfset showHistoryForContactID = SESSION.orderHistorySelectedUser>
	<cfform action="#CGI.SCRIPT_NAME#" method = "POST">
		<h2>Order History</h2>
		Customer:
		<cfquery datasource="#APPLICATION.dataSource#" name="getUsers">
			SELECT ContactID, LastName || ', ' || FirstName AS FullName FROM Contacts ORDER BY LastName, FirstName
		</cfquery>
		<cfselect name="selectedUser" selected="#SESSION.orderHistorySelectedUser#" query="getUsers" display="FullName" value="ContactID" />
		<input type="Submit" value="Go">
	</cfform>
<cfelse>
	<cfset showHistoryForContactID = contactID>
	<cfoutput>
		<h2>YourOrder History</h2>
		<p><strong>Welcome back, #contacnName#!</strong></p>
	</cfoutput>
</cfif>

<cfquery name="getOrders" datasource="#APPLICATION.dataSource#">
	SELECT OrderID, OrderDate, (SELECT Count(*) FROM MerchandiseOrdersItems oi WHERE oi.OrderID = o.OrderID) AS ItemCount
	FROM MerchandiseOrders o WHERE ContactID = #showHistoryForContactID# ORDER BY OrderDate DESC
</cfquery>

<cfset showDetail = isDefined("URL.orderID") and isNumeric(URL.orderID)>

<cfif showDetail>
	<cfquery name="getDetail" datasource="#APPLICATION.dataSource#">
		SELECT m.MerchName, oi.ItemPrice, oi.OrderQty FROM Merchandise m, MerchandiseOrdersItems oi
		WHERE m.MerchID = oi.ItemID AND oi.OrderID = #URL.orderID# AND oi.OrderID IN 
			(SELECT o.OrderID FROM MerchandiseOrders o WHERE o.ContactID = #showHistoryForContactID#)
	</cfquery>
	<cfif getDetail.recordCount eq 0>	<cfset shoDetail = False>	</cfif>
</cfif>

<cfif getOrders.recordCount eq 0>
	<p>No orders placed to date.</p>
<cfelse>
	<cfoutput>	<p>Orders placed to date: <strong>#getOrders.recordCount#</strong></p>	</cfoutput>
	<table border="1" width="300" cellpadding="5" cellpacing="2">
		<tr>	<th>Date Ordered</th> <th>Items</th>	</tr>
		<cfoutput query="getOrders">
			<cfset isExpanded = showDetail and(getOrders.OrderID eq URL.orderID)>
			<cfset arrowIcon = iif(isExpanded, "'ArrowDown.gif'", "'ArrowRight.gif'")>
			<tr>
				<td>
					<a href="OrderHistory4.cfm?orderID=#OrderID#">
						<img src="../images/#arrowIcon#" width="16" height="16" border="0">
						#dateFormat(OrderDate, "mmmm d, yyyy")#
					</a>
				</td>
				<td><strong>#ItemCount#</strong></td>
			</tr>
			<cfif isExpanded>
				<cfset orderTotal = 0>
				<tr>
					<td colspan="2">
						<table width="100%" cellspacing="0" border="0">
							<tr>	<th>Item</th><th>Qty</th><th>Price</th>		</tr>
							<cfloop query="getDetail">
								<cfset orderTotal = orderTotal + itemPrice>
								<tr>
									<td>#MerchName#</td><td>#OrderQty#</td><td>#DollarFormat(ItemPrice)#</td>
								</tr>
							</cfloop>
							<tr>
								<td colspan="2"><strong>Total:</strong></td>
								<td><strong>#dollarFormat(orderTotal)#</strong></td>
							</tr>
						</table>
					</td>
				</tr>
			</cfif>
		</cfoutput>
	</table>
</cfif>

</body>
</html>
