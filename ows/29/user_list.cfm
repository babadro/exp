<cfoutput>
<table>
    <cfloop query="get_users">
    <tr>
    <td>
	<cfif fileExists(ExpandPath("user_photos") & '/user_#contactid#_thumb.jpg')>
    <a href="user_photos/user_#contactid#.jpg"><img src="user_photos/user_#contactid#_thumb.jpg" border="0"></a>
    <cfelse>
    <img src="default.jpg" border="0">
    </cfif>
    </td>
    <td><h3>#firstname# #lastname#</h3></td>
    </tr>
</cfloop>
</table>
</cfoutput>