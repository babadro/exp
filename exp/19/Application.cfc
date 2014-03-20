<cfcomponent output="false">
	<cfset THIS.name="ows19">
	
	<cffunction name="onApplicationStart" returntype="boolean" output="false">
		<cfset AppStarted=now()>
		<cfreturn True>
	</cffunction>
	
	<cffunction name="onApplicationEnd" returntype="void" output="false">
		<cfargument name="AppScope" required="true">
		<cflog file="#this.name#" text="App ended after #dateDiff('n', arguments.AppScope.AppStarted, now())# minutes.">
	</cffunction>
	
	<cffunction name="onRequestStart" returntype="boolean" output="true">
		<cfset REQUEST.companyName="OWS Orange Whip Studios">
		<cfset REQUEST.datasource = "ows">
		<cfif not isDefined("URL.print")>
			<cfinclude template="SiteHeader.cfm">
		</cfif>
		<cfreturn True>
	</cffunction>
	
	<cffunction name="onRequestEnd" returntype="void" output="true">
		<cfif not isDefined("URL.print")>
			<cfinclude template="SiteFooter.cfm">
		</cfif>
	</cffunction>
	
	<cffunction name="onRequest" returntype="void" output="true">
		<cfargument name="targetPage" required="true" type="string">
		<cfset var content="">
		<cfif not isDefined("URL.print")>
			<cfinclude template="#arguments.targetPage#">
		<cfelse>
			<cfsavecontent variable="content">
				<cfinclude template="#arguments.targetPage#">
			</cfsavecontent>
			<cfset content=reReplace(content, "<.*?>", "", "all")>
			<cfoutput><pre>#content#</pre></cfoutput>
		</cfif>	
	</cffunction>
	
	<cffunction name="onError" returnType="void" output="false">
		
		<cfargument name="exception" required="true" >
		<cfargument name="eventName" required="true" type="string">
		
		<cfif arguments.eventName is "">
			<cflog file="#this.name#" type="error" text="#arguments.exception.message#">
		<cfelse>
			<cflog file="#this.name#" type="error" text="Error in method [#arguments.eventName#] #arguments.exception.message#">
		</cfif>
		
		<cfthrow object="#arguments.exception#">
	</cffunction>
	
	<cffunction name="onMissingTemplate" returntype="boolean" output="false">
		<cfargument name="targetPage" type="string" required="true">
		<cflog file="#THIS.name#" text="Missing Template: #arguments.targetpage#">
		<cflocation url="404.cfm?missingtemplate=#urlEncodedFormat(arguments.targetpage)#" addToken="false">
	</cffunction>
	
</cfcomponent>