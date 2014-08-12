<!---
Name:        example1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: First presentation
--->

<cfpresentation title="First Presentation" 
   autoPlay="false">

   <cfpresentationslide title="Welcome to CFPRESENTATION" 
   notes="These are some notes.">
<h1>Welcome to CFPRESENTATION</h1>

<p>
This is content for the first slide. I can include HTML
and it will be rendered by the presentation.
</p>
   </cfpresentationslide>

   <cfpresentationslide title="Sales Figures" 
   notes="These are some notes for slide two.">
<h1>Sales Figures</h1>

<p>
Some fake data.
</p>

<p>
<table width="100%" border="1">
<tr>
   <th>Product</th>
   <th>Price</th>
</tr>
<tr>
   <td>Apples</td><td>$0.99</td>
</tr>
<tr>
   <td>Bananas</td><td>$1.99</td>
</tr>
<tr>
   <td>Nukes</td><td>$2.99</td>
</tr>
</table>
</p>
   </cfpresentationslide>
</cfpresentation>