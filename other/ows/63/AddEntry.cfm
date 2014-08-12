<!--- AddEntry.cfm --->

<!--- Use the ‘ADD’ action to create a new entry --->
<CFLDAP ACTION="ADD"
   SERVER="localhost"
   USERNAME="cn=mtatam" 
   PASSWORD="mtatam_123"
   ATTRIBUTES="objectclass=organizationalPerson, person, Top;
                cn=Ben Forta; 
                sn=Forta; 
                mail=Ben_Forta@orange-whip-studios.com; 
                ou=OWS"
   DN="cn=ben_forta, cn=Recipients, ou=OWS, o=Orange Whip Studios">

<!--- Query to ensure the entry was added --->
<CFLDAP ACTION="QUERY"
   NAME="GetUser"
   SERVER="localhost"
   USERNAME="cn=mtatam" 
   PASSWORD="mtatam_123"
   SCOPE="SUBTREE"
   ATTRIBUTES="dn,cn"
   START=""
   FILTER="(cn=ben_forta)">

<!--- Display the query results --->
<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0">
 <TR>
    <TH>User (cn)</TH>
    <TH>DN</TH>
 </TR>
 <CFOUTPUT QUERY="GetUser">
 <TR>
    <TD>#cn#</TD>
    <TD>#dn#</TD>
 </TR>
 </CFOUTPUT>
</TABLE>
