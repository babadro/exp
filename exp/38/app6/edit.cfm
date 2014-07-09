<cfparam name="url.id" default="">

<cfset contact = entityLoadByPk("contact", url.id)>
<cfparam name="form.firstname" default="#contact.getFirstName()#">
<cfparam name="form.lastname" default="#contact.getLastName()#">
<cfparam name="form.email" default="#contact.getEmail()#">

<!--- Handle contacts w/o tax info --->
<cfif contact.hasTaxInfo()>
    <cfset taxInfo = contact.getTaxInfo()>
    <cfparam name="form.ssn" default="#taxInfo.getSSN()#">
    <cfparam name="form.legaluscitizen" default="#taxInfo.getLegalUSCitizen()#">
    <cfparam name="form.numberofdependants" default="#taxInfo.getNumberOfDependants()#">
<cfelse>
    <cfset taxInfo = entityNew("taxInfo")>
    <cfparam name="form.ssn" default="">
    <cfparam name="form.legaluscitizen" default="">
    <cfparam name="form.numberofdependants" default="">
</cfif>

<cfif structKeyExists(form, "save")>
    <!--- update contact --->
    <cfset contact.setFirstName(form.firstname)>
    <cfset contact.setLastName(form.lastname)>
    <cfset contact.setEmail(form.email)>

    <!--- update taxinfo --->
    <cfset taxInfo.setSSN(form.ssn)>
    <cfset taxInfo.setLegalUSCitizen(form.legaluscitizen)>
    <cfset taxInfo.setNumberOfDependants(val(form.numberofdependants))>
    <cfset taxInfo.setContact(contact)>
    <cfset entitySave(taxInfo)>

    <cfset contact.setTaxInfo(taxInfo)>
    <cfset entitySave(contact)>

    <cflocation url="index.cfm" addToken="false">
</cfif>


<cfoutput>
<form action="edit.cfm?id=#url.id#" method="post">

<h2>Edit Contact - Personal Info</h2>

<table>
    <tr>
        <td>First Name:</td>
		<td><input type="text" name="firstname" value="#form.firstname#"></td>
	</tr>
    <tr>
        <td>Last Name:</td>
        <td><input type="text" name="lastname" value="#form.lastname#"></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><input type="text" name="email" value="#form.email#"></td>
    </tr>

</table>

<h2>Edit Contact - Tax Info</h2>

<table>

    <tr>
        <td>SSN:</td>
        <td><input type="text" name="ssn" value="#form.ssn#" maxlength="10" size="10"></td>
    </tr>
	<tr>
	   <td>Legal US Citizen?</td>
	   <td>
	   <select name="legaluscitizen">
	   <option value="yes"
	   <cfif form.legaluscitizen is "" or form.legaluscitizen is true>selected</cfif>>Yes</option>
       <option value="no"
	   <cfif form.legaluscitizen neq "" and  not form.legaluscitizen>selected</cfif>>No</option>
	   </select>
	   </td>
    </tr>
    <tr>
        <td>Number of Dependants:</td>
        <td><input type="text" name="numberofdependants" value="#form.numberofdependants#" maxlength="2" size="2"></td>
    </tr>

</table>

<input type="submit" name="save" value="Save">

</form>
</cfoutput>