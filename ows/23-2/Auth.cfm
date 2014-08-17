<!--- Author: Adam Phillip Churvis -- ProductivityEnhancement.com --->
<!--- Ensures that user is authenticated and authorized --->

<cfparam name="attributes.roles" type="string" default="">

<cfif thisTag.executionMode EQ "Start">

  <!--- Check to see if the user is logged in --->
  <cflogin>
    <cfif thisTag.hasEndTag>
      <!--- If this tag is called as a paired tag and the user is not logged in,
      exit the tag now to prevent execution of any code between the start and 
      end tags. --->
      <cfexit method="ExitTag">
    <cfelse>
      <!--- If this tag is not called as a paired tag and the user is not logged
      in, redirect to the login form. --->
      <cflocation url="#Application.urlRoot#/login/LoginForm.cfm" addtoken="No">
    </cfif>
  </cflogin>
  
  <!--- Check to see if the user must be a member of one or more roles --->
  <cfif len(trim(attributes.roles)) gt 0>
    <!--- We must now see if at least one of the user's roles match those in 
    Attributes.roles --->
  
    <!--- Loop over the list of required roles --->
    <cfset inRole = FALSE>
	<cfif isUserInAnyRole(attributes.roles)>
		<cfset inRole = true>
	</cfif>
  
    <!--- Check to see if the user may access content. --->
    <cfif not inRole>
      <cfif thisTag.hasEndTag>
        <!--- If this tag is called as a paired tag and the user cannot access 
        content, exit the tag now to prevent execution of any code between the 
        start and end tags. --->
        <cfexit method="ExitTag">
      <cfelse>
        <!--- If this tag is not called as a paired tag and the user cannot 
        access content, redirect to the login form. --->
        <cflocation url="#application.urlRoot#/login/InsufficientPrivileges.cfm"
          addtoken="No">
      </cfif>
    </cfif>
  </cfif>

</cfif>