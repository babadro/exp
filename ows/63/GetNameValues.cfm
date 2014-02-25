<!--- GetNameValues.cfm  --->
<!--- Query for all (*) uid’s --->
<CFLDAP ACTION="QUERY"
   NAME="GetNamesAndValues"
   SERVER="localhost"
   USERNAME="cn=mtatam" 
   PASSWORD="mtatam_123"
   SCOPE="SUBTREE"
   ATTRIBUTES="*"
   START=""
   FILTER="(uid=*)">

<!--- Display all name/value pairs for each uid --->
<CFOUTPUT QUERY="GetNamesAndValues">
   <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0">
 <!--- Show the column headers only for the first record --->
       <CFIF CurrentRow EQ 1>
          <TR>
             <TH>Name</TH>
             <TH>Value</TH>
          </TR>
       </CFIF>
          <TR>
             <TD>#name#</TD>
             <TD>#value#</TD>
          </TR>
   </TABLE>
</CFOUTPUT>
