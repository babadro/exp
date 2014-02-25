<cfcomponent extends="helpdesk">
<cffunction name="onIncomingMessage">
	<cfargument name="CFEvent" type="struct" required="YES">
	<!--- Generate and return the message.--->
	<cfset message = trim(arguments.CFEvent.data.MESSAGE)>
	<cfset keyword = listFirst(message," ")>
	<cfset msg = "">
	<cfscript>
	if(structKeyExists(application.buddyStatus,arguments.CFEvent.data.SENDER)) {
		switch (keyword) {
			case "Accept":
				staffDetails = getStaffDetails(imid=arguments.CFEvent.data.SENDER);
				taskID = assignTask(staffDetails.userid);
				msg = staffDetails.name & " thankyou for accepting this task. The task ID is " & taskID;
				break;
			case "A": case "Assign":
				staffDetails = getStaffDetails(imid=arguments.CFEvent.data.SENDER);
				taskID = assignTask(staffDetails.userid);
				if(len(taskID) eq 0) {
					msg = "there are no unassigned tasks at this time";
				} else {
					msg = "You have been assigned a new task.";
				}
				break;
			case "R": case "reject": case "deny":
				msg = "This task has been rejected, it will be returned to the queue." & chr(13);;
				msg = msg & "You can always mark yourself as 'Away' and the helpdesk system will not automaticly alert you to new tasks";
				break;
			case "C": case "Complete": case "Close":
				// go and work out who this user is and go and get their current list of tasks
				staffDetails = getStaffDetails(imid=arguments.CFEvent.data.SENDER);
				aDetails = getTaskDetails(staffDetails.userid);
				switch(arrayLen(aDetails)) {
					case 0:
						msg = "You do not have any tasks currently active" & chr(13);
						break;
					case 1:
						closeIssue(aDetails[1].id);
						msg = "You have marked your currently active task as complete." & aDetails[1].id& chr(13);
						break;
					default:
						// this user has more than one case - check for a number after the keyword if present, close that case
						if(listLen(message,' ') gt 1 and isNumeric(ListGetAt(message,2,' '))) {	
							thisTask = ListGetAt(message,2,' ');
							closeIssue(aDetails[thisTask].id);
							msg = "You have closed task " & thisTask & ".";
						} else {
							msg = "You have more than one task open at present. Please confirm which task you wish to close." & chr(13);
							for(i =1;i lte arrayLen(aDetails);i=i+1) {
								msg = msg & i & ". " & aDetails[i].Subject & chr(13);
							}
	
						}
				}
				break;
	
			case "D": case "Details":
				staffDetails = getStaffDetails(imid=arguments.CFEvent.data.SENDER);
				aDetails = getTaskDetails(staffDetails.userid);
				if(listLen(message,' ') gt 1 and isNumeric(ListGetAt(message,2,' '))) {
					// this user has asked for a task
					thisTask = ListGetAt(message,2,' ');
					msg = "Details for task " & thisTask & chr(13);
					msg = msg & "Subject: " & aDetails[thisTask].Subject & chr(13);
					msg = msg & aDetails[thisTask].body & chr(13);
					msg = msg & "Requested by: " & aDetails[thisTask].loggedby & chr(13);
				} else {
					// work out how many cases this user has and send details
					switch (arrayLen(aDetails)) {
						case 0:
							msg = "You currently have no cases assigned to you. Do you wish to be assigned a new support case? (Assign?)";
							break;
						case 1:
							msg = "Subject: " & aDetails[1].Subject & chr(13);
							msg = msg & aDetails[1].body & chr(13);
							msg = msg & "Requested by: " & aDetails[1].loggedby & chr(13);
							break;
						default:
							msg = "You have " & arrayLen(aDetails) & " currently assigned to you." & chr(13);
							msg = msg & "To have the details of one issue use the command 'D xx' where xx is the number infront of the subject" & chr(13);
							for(i =1;i lte arrayLen(aDetails);i=i+1) {
								msg = msg & i & ". " & aDetails[i].Subject & chr(13);
							}
					}
				}
				break;
			default:
				if(len(keyword) neq 0) msg = "Your keyword '" & keyword & "' was not recoginsed." & chr(13) & chr(13);
				msg = msg & "Help" & chr(13);
				msg = msg & "The following keywords are accepted by this system" & chr(13);
				msg = msg & "Details - lists the details of your current task. You can append a task id to this command if you want the details of a single task." & chr(13);
				msg = msg & "Help - Displays this page" & chr(13);
		}
	} else {
		// this person is not a member of the team
		msg = "Unfortunatly the Help Desk system is unable to take requests via this interface. Please log your issue via the helpdesk website";
	}
	</cfscript>
	<!--- return the message --->
	<cfscript>
	retrunVal = structNew();
	retrunVal.command = "submit";
	retrunVal.buddyID = arguments.CFEvent.data.SENDER;
	retrunVal.message = msg;
	return retrunVal;
	</cfscript>
</cffunction>
<cffunction name="onAddBuddyRequest" hint="Requests from others to add the gateway ID to their buddy list.">
	<cfargument name="CFEvent" type="struct" required="YES">
	
	<!--- Return the action decision. --->
	<cfset retValue = structNew()>
	<cfset retValue.command = "accept">
	<cfset retValue.BuddyID = CFEvent.DATA.SENDER>
	<cfset retValue.Reason = "Because we are nice!">
	<cfreturn retValue> 	
</cffunction>

<cffunction name="onAddBuddyResponse" hint="Responses from others to requests from your gateway to add them to your buddy lists. Also used by buddies to ask to be removed from your list.">
	<cfargument name="CFEvent" type="struct" required="YES">
	<cflock scope="APPLICATION" timeout="10" type="EXCLUSIVE">
		<cfscript>
		//Do the following only if the buddy accepted the request.
		if (NOT StructKeyExists(Application, "buddyStatus")) {
			Application.buddyStatus=StructNew();
		}
		if (#CFEVENT.Data.MESSAGE# IS "accept") {
			//Create a new entry in the buddyStatus record for the buddy.
			if (NOT StructKeyExists(Application.buddyStatus,CFEvent.Data.SENDER)) {
				Application.buddyStatus[#CFEvent.Data.SENDER#]=StructNew();
			}
			//Set the buddy status information to indicate buddy was added.
			Application.buddyStatus[#CFEvent.Data.SENDER#].status="Buddy accepted us";
			Application.buddyStatus[#CFEvent.Data.SENDER#].timeStamp=CFEvent.Data.TIMESTAMP;
			Application.buddyStatus[#CFEvent.Data.SENDER#].message=CFEvent.Data.MESSAGE;
		}
		</cfscript>
	</cflock>
</cffunction>

<cffunction name="onBuddyStatus" hint="Presence status messages from other users.">
	<cfargument name="CFEvent" type="struct" required="YES">
	<cflock scope="APPLICATION" timeout="10" type="EXCLUSIVE">
		<cfscript>
		// Create the status structures if they don't exist.
		if (NOT StructKeyExists(Application, "buddyStatus")) {
			APPLICATION.buddyStatus=StructNew();
		}
		if (NOT StructKeyExists(Application.buddyStatus, CFEvent.Data.BUDDYNAME)) {
			APPLICATION.buddyStatus[#CFEvent.Data.BUDDYNAME#]=StructNew();
		}
		// Save the buddy status and timestamp.
		APPLICATION.buddyStatus[#CFEvent.Data.BUDDYNAME#].status=CFEvent.Data.BUDDYSTATUS;
		APPLICATION.buddyStatus[#CFEvent.Data.BUDDYNAME#].timeStamp=CFEvent.Data.TIMESTAMP;
		</cfscript>
	</cflock>
	<!--- now update our own status based on what we now know --->
	<cfset stStatus = getHelpdeskStatus()>
	<!--- now work out what status to put us in --->
	<cfif structKeyExists(stStatus,"ONLINE")>
		<cfset newstatus = "ONLINE">
	<cfelseif structKeyExists(stStatus,"AWAY")>
		<cfset newstatus = "AWAY">
	<cfelse>
		<cfset newstatus = "NA">
	</cfif>
	<cfset helper = getGatewayHelper("Helpdesk")>
	<cfset ret=helper.setStatus(newstatus, "")>
	
</cffunction>

<cffunction name="onIMServerMessage" hint="Error and status messages from the IM server.">
	<!--- This function just logs the message. --->
	<cfargument name="CFEvent" type="struct" required="YES">
	<cflog file="#CFEvent.GatewayID# Status" text="onIMServerMEssage; SENDER: #CFEvent.OriginatorID# MESSAGE: #CFEvent.Data.MESSAGE# TIMESTAMP: #CFEvent.Data.TIMESTAMP#">
</cffunction>
</cfcomponent>