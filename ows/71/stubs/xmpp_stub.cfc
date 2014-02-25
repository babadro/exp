<cfcomponent>
   <cffunction name="onIncomingMessage" hint="Standard message from IM users">
      <cfargument name="CFEvent" type="struct" required="YES">
   </cffunction>
   
   <cffunction name="onAddBuddyRequest" hint="Requests from others to add the gateway ID to their buddy list.">
      <cfargument name="CFEvent" type="struct" required="YES">
   </cffunction>
   
   <cffunction name="onAddBuddyResponse" hint="Responses from others to requests from your gateway to add them to your buddy lists. Also used by buddies to ask to be removed from your list.">
      <cfargument name="CFEvent" type="struct" required="YES">
   </cffunction>
   
   <cffunction name="onBuddyStatus" hint="Presence status messages from other users.">
      <cfargument name="CFEvent" type="struct" required="YES">
   </cffunction>
   
   <cffunction name="onIMServerMessage" hint="Error and status messages from the IM server.">
      <cfargument name="CFEvent" type="struct" required="YES">
   </cffunction>
</cfcomponent>