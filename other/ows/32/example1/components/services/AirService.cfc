
<cfcomponent alias="ows.33.example1.components.services.LcdsService">

	<cffunction name="fetch" access="remote">
		<cfscript>
			return EntityLoad("Films");
		</cfscript>
	</cffunction>



	<cffunction name="sync" access="remote">

        /**
            // First load object by ID or run query. and check the datestamp
            // if different then clientObject.. CONFLICT
            <cfset conflict = CreateObject("component","CFIDE.AIR.Conflict")
            <cfset serverobject = EntityLoadByPK("employee",#res.IDENTITYCOL#)> 
            <cfset conflict.SetServerobject(serverobject)>

            else - save object
        **/


		<cfscript>
            if( operation == "insert" || operation == "update" )
            {
                ormGetSession().merge(clientobject);
                EntitySave(obj);
            }
            else if( operation == "delete" )
            {
                ormGetSession().merge(originalobject);
                EntityDelete(obj);
            }
		</cfscript>
	</cffunction>

</cfcomponent>