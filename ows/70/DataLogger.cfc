<cfcomponent>
    <cffunction name="onIncomingMessage" output="no">
    <cfargument name="CFEvent" type="struct" required="yes">
    <cfif not IsDefined("CFEvent.Data.file")><cfset CFEvent.Data.file="defaultEventLog"></cfif>
    <cfif not IsDefined("CFEvent.Data.type")><cfset CFEvent.Data.type="info"></cfif>
    <cflog text="#CFEvent.Data.message#" 
        file="#CFEvent.Data.file#"
        type="#CFEvent.Data.type#"
        thread="yes"
        date="yes"
        time="yes"
        application="yes">
    </cffunction>
</cfcomponent>
