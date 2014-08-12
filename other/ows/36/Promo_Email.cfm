<!---
Name:          Promo_Email.cfm
Author:        David Golden, Leon Chalnick
Description:   Queries database and generates email
--->

<!--- Get all merchandise info from database --->
<cfquery name=”GetMerchInfo” datasource=”OWS”>
   SELECT MerchName, MerchDescription, MerchPrice
   FROM Merchandise
   ORDER BY FilmID
</cfquery>
<!--- Produce the email --->
<cfmail to=”dealers@ows.com” from=”store@ows.com”
 subject=”Merchandise Currently Available” 
 server=”mail.ows.com” type=”HTML”
 >
<!DOCTYPE HTML PUBLIC “-//W3C//DTD HTML 4.0 Transitional//EN”>
<html>
<head>
   <title>Available Merchandise From OWS Online Store</title>
</head>
<body>
<p>Greetings from Orange Whip Studios!</p>

<p>Here is a list of merchandise currently 
available from the online store at Orange Whip 
Studios. To order any of these items, go to
<a href=”http://www.ows.com/store/”>http://www.ows.com/store/</a>.
</p>

<!--- Display merchandise from query --->
<table border=”1”>
<tr>
   <th>Item name</th>
   <th>Description</th>
   <th>Price</th>
</tr>
<cfloop query=”GetMerchInfo”>
<cfoutput>
   <tr>
      <td>#MerchName#</td>
      <td>#MerchDescription#</td>
      <td>#DollarFormat(MerchPrice)#</td>
   </tr>
</cfoutput>
</cfloop>
</table>
</body>
</html>
</cfmail>
