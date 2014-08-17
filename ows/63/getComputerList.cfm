<!--- getComputerList.cfm --->
<CFLDAP NAME="qryGetComputerList"
   USERNAME="username"
   PASSWORD="password"
   SERVER="ows.com"
   ACTION="query"
   ATTRIBUTES="cn,  Displayname , operatingSystemVersion, operatingSystemServicePack, dnsHostName, whenChanged, WhenCreated"
   FILTER="(&(objectClass=Computer)(cn=*prod*))"
   START="DC=xx,DC=xxx,DC=xxx"
   SCOPE="subtree"
    >
<CFDUMP VAR="#qryGetComputerList#"> 
