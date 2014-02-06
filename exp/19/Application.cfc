<cfcomponent output = "false">
	<cfset This.name = "ows19">
	<cferror type = "request" template = "ErrorRequest.cfm" mailto = "baba_dro@mail.ru">
	<cferror type = "exception" template = "ErrorException.cfm" mailto = "baba_dro@mail.ru">
	
	<cffunction name = "onApplicationStart" returnType = "boolean" output = "false">
		<cfset Application.appStarted = now()>
		<cfreturn True>		
	</cffunction>
	
	<cffunction name = "onApplicationEnd" returnType = "boid" output = "false">
		<cfargument name = "appScope" required = "true">
		<cflog file = "#This.name#" text = 
		"Application ended after #dateDiff('n', arguments.appScope.appStarted, now())# minutes.">
	</cffunction>
	
	<cffunction name = "onRequestStart" returnType = "boolean" output = "true">
		<cfset REQUEST.companyName = "OWS Orange Studios">
		<cfset REQUEST.dataSource = "ows">
		
		<cfif not isDefined("URL.print")>
			<cfinclude template = "SiteHeader.cfm">
		</cfif>
		<cfreturn True>
	</cffunction>
	
	<cffunction name = "onRequestEnd" returnType = "void" output = "True">
		<cfif not isDefined("URL.print")>
			<cfinclude template = "SiteFooter.cfm">
		</cfif>
		
	</cffunction>
	
	<cffunction name = "onRequest" returnType = "void" output = "true">
		<cfargument name = "targetPage" type = "string" required = "true">
		<cfset var content = "">
		
		<cfif not isDefined("URL.print")>
			<cfinclude template = "#arguments.targetPage#">
		<cfelse>
			<cfsavecontent variable = "content">
				<cfinclude template = "#arguments.targetPage#">
			</cfsavecontent>
			<cfset content = reReplace(content, "<.*?>", "", "all")>
			<cfoutput><pre>#content#</pre></cfoutput>
		</cfif>
	</cffunction>
	
	<cffunction name = "onError" returnType = "void" output = "false">
		<cfargument name = "exception" required = "true">
		<cfargument name = "eventName" type = "string" required = "true">
	
		<cfif arguments.eventName is "">
			<cflog file = "#THIS.name#" type = "error"
			text = "#arguments.exception.message#">
		<cfelse>
			<cflog file = "#THIS.name#" type = "error"
			text = "Error in Method [#arguments.eventName#] #arguments.exception.message#">
		</cfif>
		<cfthrow object = "#arguments.exception#">
	</cffunction>
	
	<cffunction name = "onMissingTemplate" returnType = "boolean" output = "false">
		<cfargument name = "targetPage" type = "string" required = "true">
		<cflog file = "#This.name#" text =
		"Missing Template: #argumets.targetPage#">
		<cflocation url = "404.cfm?missingtemplate=#urlEncodedFormat(arguments.targetpage)#"
		addToken = "False">		
	</cffunction>
		
</cfcomponent>