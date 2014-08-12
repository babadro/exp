<!--- LDAPMailList.cfm --->
<!--- Process code if the form was submitted --->
<CFIF IsDefined(“FORM.Submit")>

 <!--- Simple form validation for each field --->
 <CFIF NOT Len(FORM.MessageTitle)>
    <CFTHROW MESSAGE="Please enter a message title.">
 </CFIF>
 <CFIF NOT Len(FORM.Message)>
    <CFTHROW MESSAGE="Please enter a message to send.">
 </CFIF>

 <!--- Run the LDAP query --->
 <CFLDAP ACTION="QUERY"
    NAME="LDAPMailList"
    SERVER="localhost"
    USERNAME="cn=mtatam"
    PASSWORD="mtatam_123"
    SCOPE="SUBTREE"
    ATTRIBUTES="cn,mail"
    START="">

 <!--- If records are returned, run CFMAIL --->
 <CFIF LDAPMailList.RecordCount>
    <CFMAIL FROM="list-serve@orange-whip-studios.com"
       TO="#mail#"
       SUBJECT="#Form.MessageTitle#"
       SERVER="mail.orange-whip-studios.com"
       QUERY="LDAPMailList">
Hello, #cn#

#FORM.Message#
    </CFMAIL>

 <!--- Feedback, sent --->
 <B>Your message was successfully sent.</B><P>

 <CFELSE>

 <!--- Feedback, failed --->
 <B>No records exist in the directory.</B>

 </CFIF>

</CFIF>

<!--- Form used to enter the mailing list contents --->
<FORM ACTION="LDAPMailList.cfm" METHOD="post">
    Enter a title for the mailing:<BR>
    <INPUT NAME="MessageTitle" MAXLENGTH="200" SIZE="40"><P>

    Enter the message text:<BR>
    <TEXTAREA NAME="Message" COLS="40" ROWS="7"></TEXTAREA><P>

    <INPUT TYPE="Submit" NAME"Submit" VALUE="Send Message">
</FORM>
