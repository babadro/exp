<cfcomponent>
      <cffunction name="newMailCount" output="no">
       <cfargument name="CFEvent" type="struct" required="yes">
       <cfset data = CFEvent.data>
         
         <!--- NEWMAILCOUNT --->
            <cflog file="pop3gateway" text="you have #data.NewMailCount#">
      </cffunction>
</cfcomponent>
