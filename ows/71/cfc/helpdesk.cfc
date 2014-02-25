<cfcomponent>
	<cffunction name="GetIssues" access="public" returntype="query" hint="This goes and gets all of the issues from our database">
		<cfargument name="statusFilter" default="All" type="string" required="no">
		<cfquery datasource="#application.dsn#" name="qGetIssues">
		SELECT issues.id, issues.subject, issues.body, issues.DateLogged, issues.status, issues.loggedby,issues.loggedbyemail, issues.assignedto,helpdeskstaff.name
		FROM issues LEFT OUTER JOIN helpdeskstaff ON issues.assignedto = helpdeskstaff.userid
		WHERE 1=1
		<cfif arguments.statusFilter neq "All">
		AND status = "#arguments.statusFilter#"
		</cfif>
		order by DateLogged
		</cfquery>
		<cfreturn qGetIssues>
	</cffunction>
	<cffunction name="submitIssue" access="public" returntype="boolean" hint="This adds a new issue to the database">
		<cfargument name="subject" type="string" required="yes">
		<cfargument name="name" type="string" required="yes">
		<cfargument name="email" type="string" required="yes">
		<cfargument name="body" type="string" required="yes">
		<!--- add to database --->
		<cfquery datasource="#application.dsn#" name="qInsertIssue">
		Insert into issues
		(id,status,subject,DateLogged,Assignedto,loggedby,loggedbyemail,body)
		values
		('#createUUID()#','unassigned','#arguments.subject#',#CreateODBCDateTime(Now())#,'unassigned','#arguments.name#','#arguments.email#','#arguments.body#')
		</cfquery>
		<!--- check to see if we have an operative online --->
		<cfset stStatus = getHelpdeskStatus()>
		<cfif structKeyExists(stStatus,"ONLINE")>
			<!--- alert the first available guy --->
			<cfscript> 
			msg = StructNew(); 
			msg.command = "Submit"; msg.message = "A new helpdesk item has been logged - do you wish to Accept or Reject it? (A/R)?"; 
			msg.buddyID = stStatus["ONLINE"][1]; 
			SendGatewayMessage("helpdesk", msg); 
			</cfscript>
			
		<cfelse>
			<cfset msg = "Your request has been queue">
		</cfif>
		
		<cfreturn true>
	</cffunction>
	<cffunction name="closeIssue" access="public" returntype="boolean" hint="The marks a case as complete">
		<cfargument name="id" type="uuid" required="yes">
			<cfquery datasource="#application.dsn#" name="qGetStaffDetails" result="query">
			UPDATE issues
			SET status = 'complete'
			where id = '#arguments.id#'
			</cfquery>

		<cfreturn true>
	</cffunction>
	<cffunction name="getHelpdeskStatus" access="public" returntype="struct" hint="This returns the vairous ">
		<cfset stStatus = structNew()>
		<cfloop collection="#APPLICATION.BuddyStatus#" item="key">
			<cfscript>
			if(NOT StructKeyExists(stStatus, APPLICATION.buddyStatus[key].Status)) {
				stStatus[APPLICATION.buddyStatus[key].Status] = ArrayNew(1);
			}
			ArrayAppend(stStatus[APPLICATION.buddyStatus[key].Status],key);
			</cfscript>
		</cfloop>
		<cfreturn stStatus>
	</cffunction>
	<cffunction name="getStaffDetails" access="public" returntype="any">
		<cfargument name="imid" required="no" default="">
		<cfargument name="userid" required="no" default="">
		<cfargument name="smsid" required="no" default="">
		<cfquery datasource="#application.dsn#" name="qGetStaffDetails" result="query">
		SELECT * FROM helpdeskstaff
		WHERE 1=1
		<cfif arguments.imid neq "">
		AND imid = '#arguments.imid#'
		</cfif>
		<cfif arguments.userid neq "">
		AND userid = '#arguments.userid#'		
		</cfif>
		<cfif arguments.smsid neq "">
		AND smsid = '#arguments.smsid#'
		</cfif>
		</cfquery>
		<cfset staffDetails = structNew()>		
		<cfloop list="#query.columnlist#" index="colname">
			<cfset staffDetails[#colname#] = qGetStaffDetails[#colname#]>
		</cfloop>
		<cfreturn staffDetails>
	</cffunction>
	<cffunction name="assignTask" access="private">
		<cfargument name="userid" type="string" required="yes">
		<!--- this method will assign the next avaiable task to the IM user passed in --->
		<cfset qIssues = GetIssues("unassigned")>
		<cfif qIssues.recordcount neq 0>
			<cfquery datasource="#application.dsn#" name="qGetStaffDetails" result="query">
			UPDATE issues
			SET status = 'assigned',
			assignedto = #staffDetails.userid#
			where id = '#qIssues.id#'
			</cfquery>
			<!--- this really should check to see if the user is already assigned to a task but it doesn't --->
			<cfset taskID = qIssues.id>
		<cfelse>
			<cfset taskID = "">
		</cfif>
		<cfreturn taskID>
	</cffunction>
	<cffunction name="getTaskDetails" access="private" returntype="array">
		<cfargument name="userid" type="string" required="yes">
		<cfquery datasource="#application.dsn#" name="qGetIssues" result="query">
		SELECT issues.id, issues.subject, issues.body, issues.DateLogged, issues.status, issues.loggedby, issues.assignedto,helpdeskstaff.name
		FROM issues LEFT OUTER JOIN helpdeskstaff ON issues.assignedto = helpdeskstaff.userid
		WHERE 1=1
		AND issues.assignedto = #arguments.userid#
		AND issues.status = "ASSIGNED"
		ORDER by DateLogged
		</cfquery>
		<cfset aIssues = arrayNew(1)>
		<cfloop query="qGetIssues">
			<cfset issue = structNew()>
			<cfloop list="#query.columnlist#" index="colname">
				<cfset issue[#colname#] = #evaluate("qGetIssues.#colname#")#>
			</cfloop>
			<cfset rc = arrayAppend(aIssues,issue)>
		</cfloop>
		<cfreturn aIssues>		
	</cffunction>
</cfcomponent>