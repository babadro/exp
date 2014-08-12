<cfcomponent alias="ows.33.example1.components.services.RpcService">
	
	<cffunction name="getAllFilms" access="remote">
		<cfscript>
			return entityLoad("Films");
		</cfscript>		
	</cffunction>
	
	<cffunction name="saveFilm" access="remote">
		<cfargument name="filmObject" required="true"/>
		<cfscript>
			var session = ormGetSession();
			return session.merge(filmObject);
			//entitySave(filmObject);
		</cfscript>
	</cffunction>
	
</cfcomponent>