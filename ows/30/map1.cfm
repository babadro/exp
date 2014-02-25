<!---
Name:        map1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic map examples.
--->

<h2>The Jedi</h2>

<cfmap centeraddress="403 Robinhood Circle, Lafayette, LA" />

<h2>The Jedi - Closer</h2>

<cfmap centeraddress="403 Robinhood Circle, Lafayette, LA" 
       zoomlevel="9" type="terrain" />

<h2>The Jedi - Too Close</h2>

<cfmap centeraddress="403 Robinhood Circle, Lafayette, LA" 
    zoomlevel="17" type="satellite" title="Home, Sweet, Home"
    hideborder="false" />
