<cfcomponent>
	<cfscript>
		this.name="Helpdesk";
		this.sessionmanagement=true;
		this.setclientcookies=true;
		this.applicationtimeout=1*60*60;
	</cfscript>

	<cffunction name="onApplicationStart" returnType="boolean">
		<cfset Application.dsn = "helpdesk">
		<!--- go and get the list of buddies from the Gateway --->
		<cfscript>
		helper = getGatewayHelper("Helpdesk");
		aBuddyList = helper.getBuddyList();
		</cfscript>
		<!--- go and get the list of all users who can access this system from the DB --->
		<cfquery datasource="#Application.DSN#" name="qGetUsers">
		SELECT userid,imid,name
		FROM helpdeskstaff
		</cfquery>
		<cfset staffList = valueList(qGetUsers.imid)>
		<cfscript>
			for(i=1;i lte arrayLen(aBuddyList);i=i+1) {
				if(listContains(staffList,aBuddyList[i])) {
					//delete them from the list of users
					staffList = listDeleteAt(staffList,(listFind(staffList,aBuddyList[i])));
				} else {
					//this buddy should not be here
					helper.removeBuddy(aBuddyList[i],"Helpdesk Staff");
				}
			}
			// now stafflist only contains staff members who are not on the buddylist
		</cfscript>
		<!--- go and get the list of all users who can access this system from the DB --->
		<cfquery datasource="#Application.DSN#" name="qGetUsers">
		SELECT userid,imid,name
		FROM helpdeskstaff
		<cfif ListLen(staffList) gt 0>
		WHERE IMID in (#ListQualify(staffList,"'")#)
		</cfif>
		</cfquery>
		<!--- loop over this query and generate buddy list requests --->
		<cfloop query="qGetUsers">
			<cfset rc = helper.addBuddy(qGetUsers.IMID,qGetUsers.Name,"Helpdesk Staff")>
		</cfloop>
		<!--- go an get the most recent status of all users --->
		<cfscript>
		aBuddyList = helper.getBuddyList();
		for(i=1;i lte arrayLen(aBuddyList);i=i+1) {
			// store this status in an applicaiton var so the rest of the applicaiton has access to it
			// Create the status structures if they don't exist.
			if (NOT StructKeyExists(Application, "buddyStatus")) {
				APPLICATION.buddyStatus=StructNew();
			}
			if (NOT StructKeyExists(Application.buddyStatus, aBuddyList[i])) {
				APPLICATION.buddyStatus[#aBuddyList[i]#]=StructNew();
			}
			//get the status for this buddy
			status = helper.getBuddyInfo(aBuddyList[i]);
			//find the node in the array that contains the data that we need
			for(j=1;j lte arrayLen(status);j=j+1) {
				if(status[j].BuddyListType eq "BUDDY_LIST")
				{
					// save the status data
					APPLICATION.buddyStatus[#aBuddyList[i]#].status=status[j].BUDDYSTATUS;
					APPLICATION.buddyStatus[#aBuddyList[i]#].timeStamp=status[j].BUDDYSTATUSTIME;
				}
			}
		}
		</cfscript>
		<cfreturn true>
	</cffunction>
	<cffunction name="onRequestStart">
		<cfif structKeyExists(URL,"reload")>
			<cfset onApplicationStart() />
		</cfif>
	</cffunction>	
</cfcomponent>