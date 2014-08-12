
<cfcomponent alias="ows.33.example1.components.services.LcdsService">

	<cffunction name="fill" access="remote">
		<cfscript>
			return EntityLoad("Films");
		</cfscript>
	</cffunction>
	


	<cffunction name="sync" access="remote">
		<cfargument name="changes" type="array" required="yes">	
		<cfscript>
			for( i=1; i <= arrayLen(arguments.changes); i++ )
			{
				new_ = arguments.changes[i].getNewVersion();
				EntitySave(new_);
				arguments.changes[i].setNewVersion(new_);
				
			}
			
			return changes;
		</cfscript>
	</cffunction>


	<cffunction name="get" access="remote">
		<cfargument name="id_">
		<cfscript>
			return EntityLoad("Films", id_);
		</cfscript>
	</cffunction>


	<cffunction name="count" access="remote">
		<cfscript>
			var count = 0;
			var sql = "select count(*) from Films";
			// run a sql query through hibernate (with some simple java to get the 1st row int value.)
			count = ormGetSession().createQuery(sql).iterate().next().intValue();
			return count;
		</cfscript>
	</cffunction>
</cfcomponent>