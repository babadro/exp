<!--- GetDN.cfm --->

<CFLDAP ACTION="QUERY"
   NAME="GetDN"
   SERVER="localhost"
   USERNAME="cn=mtatam" 
   PASSWORD="mtatam_123"
   SCOPE="SUBTREE"
   ATTRIBUTES="dn,cn,telephonenumber"
   START=""
   FILTER="(uid=jtappermtatam)">

<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0">
    <TR>
       <TH>User (cn)</TH>
       <TH>DN</TH>
       <TH>Telephone</TH>
    </TR>
 <CFOUTPUT QUERY="GetDN">
    <TR>
       <TD>#cn#</TD>
       <TD>#dn#</TD>
       <TD>#telephonenumber#</TD>
    </TR>
 </CFOUTPUT>
</TABLE>
