<!--- 
Name:         ListUnsubscribe_Task.cfm
Author:       Leon Chalnick, Matt Tatam
Description:  Creates a scheduled task to
              Run ListUnsubscriber.cfm
              once per hour starting at
              2:00:00 AM on 7/18/13 November 20072009. 
--->
<cfschedule
  task=”Mailing list unsubscriber”
  action=”UPDATE”
  operation=”HTTPRequest”
  url=”http://localhost:8500/ows/2120/ListUnsubscriber.cfm”
  interval=”3600”
  startdate=”7/18/200713/11/2009”
  starttime=”02:00:00 AM”
>
