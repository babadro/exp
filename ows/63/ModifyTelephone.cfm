<!--- ModifyTelephone.cfm  --->
<!--- Update the ‘telephoneNumber’ value --->
<!--- The DN value is used from a previous CFLDAP call --->
<CFLDAP ACTION="MODIFY"
 SERVER="localhost"
 USERNAME="cn=mtatam" 
 PASSWORD="mtatam_123"
 ATTRIBUTES="telephonenumber=(919) 555 - 5555"
 DN="#GetDN.DN#">

<!--- Run a query to gather the new results --->
<CFLDAP ACTION="QUERY"
 NAME="GetUserData"
 SERVER="localhost"
 USERNAME="cn=mtatam" 
 PASSWORD="mtatam_123"
 SCOPE="SUBTREE"
 ATTRIBUTES="dn,cn,telephonenumber"
 START=""
 FILTER="(uid=mtatam)">

<!--- Display the new results --->
<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0">
    <TR>
       <TH>User (cn)</TH>
       <TH>DN</TH>
       <TH>Telephone</TH>
    </TR>
 <CFOUTPUT QUERY="GetUserData">
    <TR>
       <TD>#cn#</TD>
       <TD>#dn#</TD>
       <TD>#telephonenumber#</TD>
    </TR>
 </CFOUTPUT>
</TABLE>
