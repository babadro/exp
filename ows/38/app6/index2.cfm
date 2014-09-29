<cfset contacts = entityLoad("contact",{}, "lastname, firstname")>

<h2>Contacts</h2>

<table border="1" width="100%">
    <tr>
        <th>Name</th><th>Email</th><td></td>
	</tr>
	<cfloop index="contact" array="#contacts#">
	<cfoutput>
	<tr>
	   <td>#contact.getName()#</td>
	   <td><a href="mailto:#contact.getEmail()#">#contact.getEmail()#</a></td>
	   <td><a href="edit.cfm?id=#contact.getContactId()#">Edit</a></td>
    </tr>
	</cfoutput>
    </cfloop>
</table>
