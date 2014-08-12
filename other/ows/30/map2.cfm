<!---
Name:        map2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Map item example.
--->

<cfmap centeraddress="403 Robinhood Circle, Lafayette, LA"
       zoomlevel="13">

    <cfmapitem address="Pinhook Road, Lafayette, LA" 
               tip="Pinhook Road"
               markerwindowcontent="Busy during lunch...">
    <cfmapitem address="Johnston Street, Lafayette, LA" 
               tip="Johnston"
               markerwindowcontent="Visit the comic book store!">
    
</cfmap>