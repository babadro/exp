<!--- 
Name:          Schedule_Create_SOLR_UPDATE.cfm
Author:        Matt Tatam
Description:   Schedules the OWS_SOLR_Update.cfm at 9:00 am
--->
<cfschedule 
action="UPDATE"
task="Update OWS SOLR Collection"
operation="HTTPRequest"
url="http://localhost:8500/ows/36/OWS_SOLR_Update.cfm"
startdate="13/11/2009"
startTime="09:00 am"
interval="Daily" />


