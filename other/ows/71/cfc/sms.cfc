<cfcomponent>
<cffunction name="onIncomingMessage" hint="Standard message from SMS users">
	<cfargument name="CFEvent" type="struct" required="YES">
	<cfmail to="lucas@thebitbucket.net" from="lsherwood@macromedia.com" type="html" subject="sms debug">
	<cfdump var="#arguments.CFEvent#">
	</cfmail>
	<!--- Generate and return the message.--->
	<cfscript>
	msg = structNew();
	msg.command = "submit";
	msg.sourceAddress = arguments.CFEvent.gatewayID;
	msg.destAddress = arguments.CFEvent.originatorID;
	msg.shortMessage = Trim(arguments.CFEvent.data.message);
	
	return msg;
	</cfscript>	
</cffunction>
</cfcomponent>