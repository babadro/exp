<!--- LDAP.cfc --->
<CFCOMPONENT>
    <CFSCRIPT>
        init();
    </CFSCRIPT>
    <CFFUNCTION NAME="init">
        <CFSET serverAddr = “localhost">
        <CFSET username="mtatam">
        <CFSET password="mtatam_123">
        <CFSET organization="Impact Force.">
        <CFSET ou="Tech">
    </CFFUNCTION>
    <CFFUNCTION NAME="getUsers" RETURNTYPE="query" ACCESS="public">
        <CFARGUMENT NAME="filter" TYPE="string" DEFAULT="*">
        <CFARGUMENT NAME="start" TYPE="string" REQUIRED="true">
        
        <CFARGUMENT NAME="filterType" TYPE="string" 
            HINT="AD for ActiveDirectory, LDAP for ADSI or LDAP">
        <CFSET var getEmail="">
        <CFIF filterType eq “LDAP">
            <CFSET getEmail = getUsersByUID(filter,start)>
        <CFELSEIF filterType eq “AD">
            <CFSET getEmail = getUsersByCN(filter,start)>
        </CFIF>
        <CFRETURN getEmail>
    </CFFUNCTION>
    <CFFUNCTION NAME="getUsersByUID" RETURNTYPE="query" ACCESS="private">
        <CFARGUMENT NAME="filter" TYPE="string" DEFAULT="*">
        <CFARGUMENT NAME="start" TYPE="string" REQUIRED="true">
        <CFSET var getEmail="">
        <CFLDAP 
             ACTION="QUERY"
             NAME="GetEmail"
             SERVER="#serverAddr#"
             USERNAME="cn=#username#" 
             PASSWORD="#password#"
             SCOPE="SUBTREE"
             ATTRIBUTES="dn,cn,mail,objectclass"
             START="#attributes.start#"
             FILTER="(uid=#arguments.filter#)">
        <CFRETURN getEmail>
    </CFFUNCTION>
    <CFFUNCTION NAME="getUsersByCN" RETURNTYPE="query" ACCESS="private">
        <CFARGUMENT NAME="filter" TYPE="string" DEFAULT="*">
        <CFSET var getEmail="">
        <CFLDAP 
             ACTION="QUERY"
             NAME="GetEmail"
             SERVER="#serverAddr#"
             USERNAME="cn=#username#" 
             PASSWORD="#password#"
             SCOPE="SUBTREE"
             ATTRIBUTES="dn,cn,mail,objectclass"
             START="#attributes.start#"
             FILTER="(cn=#arguments.filter#)">
        <CFRETURN getEmail>
    </CFFUNCTION>
    
    <CFFUNCTION NAME="getNameValuePairs" RETURNTYPE="query">
        <CFARGUMENT NAME="start" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="filterType" TYPE="string" 
            HINT="AD for ActiveDirectory, LDAP for ADSI or LDAP" 
            DEFAULT="LDAP">
        <CFSET var getNamesAndValues="">
        <CFIF filterType eq “LDAP">
          <CFSET getNamesAndValues=getNameValuePairsByUID(arguments.start)>
        <CFELSEIF filterType eq “AD">
          <CFSET getNamesAndValues=getNameValuePairsByCN(arguments.start)>
        </CFIF>
        <CFRETURN getNamesAndValues>     
    </CFFUNCTION>
    <CFFUNCTION 
        NAME="getNameValuePairsByUID" RETURNTYPE="query" ACCESS="private">
        <CFSET var GetNamesAndValues="">
        <CFLDAP ACTION="QUERY"
             NAME="GetNamesAndValues"
             SERVER="#serverAddr#"
             USERNAME="cn=#username#" 
             PASSWORD="#password#"
             SCOPE="SUBTREE"
             ATTRIBUTES="*"
             START="#attributes.start#"
             FILTER="(uid=*)">
        <CFRETURN getNamesAndValues>     
    </CFFUNCTION>
    <CFFUNCTION 
        NAME="getNameValuePairsByCN" RETURNTYPE="query" ACCESS="private">
        <CFSET var GetNamesAndValues="">
        <CFLDAP ACTION="QUERY"
             NAME="GetNamesAndValues"
             SERVER="#serverAddr#"
             USERNAME="cn=#username#" 
             PASSWORD="#password#"
             SCOPE="SUBTREE"
             ATTRIBUTES="*"
             START="#attributes.start#"
             FILTER="(cn=*)">
        <CFRETURN getNamesAndValues>     
    </CFFUNCTION>    
    
    <CFFUNCTION NAME="addUser" RETURNTYPE="Boolean">
        <CFARGUMENT NAME="cn" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="sn" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="email" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="uid" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="objectClass" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="dn" TYPE="string" 
            DEFAULT="cn=#arguments.uid#, cn=Recipients, ou=#ou#, o=#organization#">
        <CFTRY>
            <CFLDAP ACTION="ADD"
                 SERVER="#serverAddr#"
                 USERNAME="cn=#username#" 
                 PASSWORD="#password#"
                 ATTRIBUTES="objectclass=#arguments.objectClass#;
                     cn=#arguments.cn#; 
                     sn=#arguments.sn#; 
                     mail=#arguments.email#; 
                     ou=#ou#"
                 DN="#arguments.dn#">
            <CFCATCH>
                <CFRETURN false>
            </CFCATCH>
        </CFTRY>     
        <CFRETURN true>
    </CFFUNCTION>
    <CFFUNCTION NAME="modifyUserSingleField" RETURNTYPE="Boolean">
        <CFARGUMENT NAME="dn" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="modifyField" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="modifyValue" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="modifyType" TYPE="string" DEFAULT="REPLACE">
        <CFTRY>
            <CFLDAP ACTION="MODIFY"
               MODIFYTYPE="#arguments.modifyType#"
               SERVER="#serverAddr#"
               USERNAME="cn=#username#" 
               PASSWORD="#password#"
               ATTRIBUTES="#arguments.modifyField#=#arguments.modifyValue#"
               DN="#arguments.DN#">
             <CFCATCH>
                <CFRETURN false>
            </CFCATCH>
        </CFTRY>     
        <CFRETURN true>
    </CFFUNCTION>
    <CFFUNCTION NAME="modifyUserMultiField" RETURNTYPE="Boolean">
        <CFARGUMENT NAME="dn" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="modifyFieldArray" TYPE="Array" REQUIRED="true">
        <CFARGUMENT NAME="modifyValueArray" TYPE="Array" REQUIRED="true">
        <CFARGUMENT NAME="modifyType" TYPE="string" DEFAULT="REPLACE">
        <CFSET var attributeString = “">
        <CFTRY>
            <CFLOOP FROM="1" TO="#arrayLen(modifyFieldArray)#" INDEX="i">
                <CFSET attributeString = attributeString & modifyFieldArray[i]&"="&modifyValueArray[i]&"; “>
            </CFLOOP>
            <CFLDAP ACTION="MODIFY"
                 SERVER="#serverAddr#"
                 MODIFYTYPE="#arguments.modifyType#"
                 USERNAME="cn=#username#" 
                 PASSWORD="#password#"
                 ATTRIBUTES="#attributeString#"
                 DN="#arguments.DN#">
            <CFCATCH>
                <CFRETURN false>
            </CFCATCH>
        </CFTRY>     
        <CFRETURN true>
    </CFFUNCTION>
    <CFFUNCTION NAME="deleteUser" RETURNTYPE="Boolean">
        <CFARGUMENT NAME="dn" TYPE="string" REQUIRED="true">
        <CFTRY>
            <CFLDAP ACTION="DELETE"
                SERVER="#serverAddr#"
                USERNAME="cn=#username#" 
                PASSWORD="#password#"
                DN="#attributes.dn#">
            <CFCATCH>
                <CFRETURN false>
            </CFCATCH>
        </CFTRY>     
        <CFRETURN true>    
    </CFFUNCTION>
    <CFFUNCTION NAME="modifyDN" RETURNTYPE="Boolean">
        <CFARGUMENT NAME="newDN" TYPE="string" REQUIRED="true">
        <CFARGUMENT NAME="oldDN" TYPE="string" REQUIRED="true">
        <CFTRY>
            <CFLDAP ACTION="MODIFYDN"
                SERVER="#serverAddr#"
                USERNAME="cn=#username#" 
                PASSWORD="#password#"
                ATTRIBUTES="#attributes.newDN#"
                DN="#attributes.oldDN#">
            <CFCATCH>
                <CFRETURN false>
            </CFCATCH>
        </CFTRY>     
        <CFRETURN true>        
    </CFFUNCTION>    
</CFCOMPONENT>
