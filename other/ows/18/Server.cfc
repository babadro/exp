<cfcomponent>

   <cffunction name="onServerStart">
	  <cflog file="myserver" text="Server starting up!">
	  <cfmail to="you@yourdomain.com" from="you@yourdomain.com" 
	  subject="Server Started">
The ColdFusion Server just started up.
     </cfmail>
   </cffunction>
	
</cfcomponent>