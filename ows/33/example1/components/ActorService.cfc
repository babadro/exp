<cfcomponent>

	<cffunction name="fetch" access="remote">
		<cfset results = EntityLoad ("ACTORS")>
		<cfreturn results/>
	</cffunction>



	<cffunction name="sync" access="remote">
		<cfargument name="operations" type="array" required="true"> 
		<cfargument name="clientobjects" type="array" required="true">
		<cfargument name="originalobjects" type="array" required="false"> 
		
		<cfset var conflicts = ArrayNew(1)> 
		<cfset var conflictcount = 1> 
		<cfset var operation = ""> 
	    <cfset var clientobject = ""> 
	    <cfset var originalobject = ""> 
		
		<!---cfdump var="#arguments#" output="console" showudfs="false"/--->
		 
		<cfloop index="i" from="1" to="#ArrayLen( operations )#"> 
			<cfset operation = operations[i]> 
		    <cfset clientobject = clientobjects[i]> 
		    <cfset originalobject = originalobjects[i]> 
		
		
			<cfif operation eq "INSERT" and !isSimpleValue(clientobject)> 
                <cfset obj = ORMGetSession().merge(clientobject)> 
                <cfset EntitySave(obj)> 
			
			<cfelseif listfindnocase("UPDATE,DELETE", operation) neq 0 >
				<cfif not isSimpleValue(originalobject)>			        
			        <cfset serverobject = EntityLoadByPK("ACTORS",originalobject.GETACTORID())>
			        <cfif not isdefined('serverobject') > 
			            	<cflog text="CONFLICT::SERVER OBJECT NOT FOUND, RECORD MAY BE DELETED ALREADY"> 
		                    <cfset conflict = CreateObject("component","CFIDE.AIR.conflict")> 
		                    <cfset conflict.clientobject = clientobject> 
		                    <cfset conflict.originalobject = originalobject> 
		                    <cfset conflict.operation = operation> 
		                    <cfset conflicts[conflictcount++] = conflict> 
		                    <cfcontinue> 
		            </cfif>
				</cfif>
				
				<!--- should work but doesn't, let's blame beta software--->
				<cfset isNotConflict = ObjectEquals(originalobject, serverobject)> 
				<cflog text="isNotConflict: #isNotConflict#">   
				<cfdump var="#serverobject#" output="console" showudfs="false"/>
				<cfdump var="#originalobject#" output="console" showudfs="false"/>		 
				<cflog text="#serverobject.getNAMEFIRST()#: #serverobject.getNAMEFIRST() eq originalobject.getNAMEFIRST()#">
				<cflog text="#serverobject.getNAMELAST()#: #serverobject.getNAMELAST() eq originalobject.getNAMELAST()#">
				<cflog text="#serverobject.getACTORID()#: #serverobject.getACTORID() eq originalobject.getACTORID()#">
				<cflog text="#serverobject.getAGE()#: #serverobject.getAGE() eq originalobject.getAGE()#">
				<cflog text="#serverobject.getNAMEFIRSTREAL()#: #serverobject.getNAMEFIRSTREAL() eq originalobject.getNAMEFIRSTREAL()#">
				<cflog text="#serverobject.getNAMELASTREAL()#: #serverobject.getNAMELASTREAL() eq originalobject.getNAMELASTREAL()#">
				<cflog text="#serverobject.getAGEREAL()#: #serverobject.getAGEREAL() eq originalobject.getAGEREAL()#">
				<cflog text="#serverobject.getISEGOMANIAC()#: #serverobject.getISEGOMANIAC() eq originalobject.getISEGOMANIAC()#">
				<cflog text="#serverobject.getISTOTALBABE()#: #serverobject.getISTOTALBABE() eq originalobject.getISTOTALBABE()#">
				<cflog text="#serverobject.getGENDER()#: #serverobject.getGENDER() eq originalobject.getGENDER()#">

				
				 
	            <cfset isNotConflict = serverobject.getNAMEFIRST() eq originalobject.getNAMEFIRST() 
										&& serverobject.getNAMELAST() eq originalobject.getNAMELAST() 
										&& serverobject.getAGE() eq originalobject.getAGE()>
	            <cfif isNotConflict> 
                    <cfif operation eq "UPDATE">
                   		<cflog text="update object"> 
                        <cfset obj = ORMGetSession().merge(clientobject)> 
                        <cfset EntitySave(obj)>           
                    <cfelseif operation eq "DELETE">
                    	<cflog text="delete object"> 
                        <cfset obj = ORMGetSession().merge(originalobject)> 
                        <cfset EntityDelete(obj)> 
                    </cfif> 
	            <cfelse><!----Conflict---> 
                    <cflog text = "is a conflict"> 
                    <cfset conflict = CreateObject("component","CFIDE.AIR.conflict")> 
                    <cfset conflict.serverobject = serverobject> 
                    <cfset conflict.clientobject = clientobject> 
                    <cfset conflict.originalobject = originalobject> 
                    <cfset conflict.operation = operation> 
                    <cfset conflicts[conflictcount++] = conflict> 
                    <cfcontinue> 
	            </cfif> 
		    </cfif> 
					
		</cfloop>
		
		<cfreturn conflicts>
	</cffunction>
	
	
		
	
	<!---
		* This is a simple example of a sync method 	
	<cffunction name="sync" access="remote">
		<cfargument name="operations" type="array" required="true"> 
		<cfargument name="clientobjects" type="array" required="true">
		<cfargument name="originalobjects" type="array" required="false"> 
		
		
		<cfset conflicts = ArrayNew(1)> 
		<cfset conflictcount = 1> 
		 
		<cfloop index="i" from="1" to="#ArrayLen( operations )#"> 
			<cfset operation = operations[i]> 
		    <cfset clientobject = clientobjects[i]> 
		    <cfset originalobject = originalobjects[i]> 
		
			<cfif operation eq "INSERT" and !isSimpleValue(clientobject)> 
	            <!--- createObject(clientObject) --->
			<cfelseif operation eq "UPDATE" and !isSimpleValue(clientobject)>
				<!--- updateObject(clientObject) --->
			<cfelseif operation eq "DELETE">
				<!--- deleteObject(originalObject) --->
			</cfif>
			
		</cfloop>
		
		<cfreturn conflicts>
	</cffunction>
	--->
		
	
</cfcomponent>