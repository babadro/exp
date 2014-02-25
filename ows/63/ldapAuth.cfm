<!--- ldapauth.cfm  --->
<CFLOGIN>
    <CFIF NOT ISDEFINED(“FORM.USERNAME")>    
        <CFINCLUDE TEMPLATE="LOGIN/LOGIN_FORM.CFM">
        <CFABORT>
    <CFELSE>    
        <CFTRY>
           <CFLDAP ACTION="QUERY"
              NAME="AUTH"
              ATTRIBUTES="cn"
              START="cn=users,dc=tatam,dc=net"
              SERVER="localhost"
              PORT="389"
              USERNAME="#FORM.USERNAME#"
              PASSWORD="#FORM.PASSWORD#">
           <CFSET ISAUTHENTICATED="YES">    
           <CFCATCH TYPE="ANY">
              <CFSET ISAUTHENTICATED="NO">
           </CFCATCH>
        </CFTRY>
        <CFIF VARIABLES.ISAUTHENTICATED>
            <CFLOGINUSER 
                NAME="#FORM.USERNAME#" 
                PASSWORD="#FORM.PASSWORD#" 
                ROLES="AUTHENTICATED USER">
        <CFELSE>
            <CFINCLUDE TEMPLATE="LOGIN/LOGIN_FORM.CFM">
            <H3>YOUR INFORMATION IS NOT VALID.
            PLEASE TRY AGAIN.</H3>
            <CFABORT>
        </CFIF>
    </CFIF>
</CFLOGIN>

