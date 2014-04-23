<cfcomponent>
<cfset this.name = "cfcoutsidewebroot">
<cfset this.sessionmanagement = true>
<Cfset mappingname = "/mycfcs">
<Cfset mappingpath = "c:\components\">
<cfset this.mappings[mappingname] = mappingpath>
</cfcomponent>