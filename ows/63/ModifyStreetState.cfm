<!--- ModifyStreetState.cfm --->
<!--- Update the ‘street’ and ‘state’ values --->
<CFLDAP ACTION="MODIFY"
 SERVER="localhost"
 USERNAME="cn=mtatam" 
 PASSWORD="mtatam_123"
 ATTRIBUTES="st=NC; street=123 Orange Whip Lane"
 MODIFYTYPE="ADD"
 DN="cn=mtatam,cn=Recipients,ou=OWS,o=Orange Whip Studios">

<!--- Run a query to gather the new results --->
<CFLDAP ACTION="QUERY"
 NAME="GetDN"
 SERVER="localhost"
 USERNAME="cn=mtatam" 
 PASSWORD="mtatam_123"
 SCOPE="SUBTREE"
 ATTRIBUTES="cn,street,st"
 START=""
 FILTER="(uid=mtatam)">

<!--- Display the new results --->
<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0">
    <TR>
       <TH>User (cn)</TH>
       <TH>Street</TH>
       <TH>State</TH>
    </TR>
 <CFOUTPUT QUERY="GetDN">
    <TR>
       <TD>#cn#</TD>
       <TD>#street#</TD>
       <TD>#st#</TD>
    </TR>
 </CFOUTPUT>
</TABLE>
