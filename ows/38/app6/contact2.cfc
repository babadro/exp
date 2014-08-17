<cfcomponent persistent="true" table="contacts">

    <cfproperty name="contactid" fieldType="id" generator="increment" type="numeric">
    <cfproperty name="firstname" ormtype="string">
    <cfproperty name="lastname" ormtype="string">
    <cfproperty name="email" ormtype="string">

    <cfproperty name="taxinfo" fieldtype="one-to-one" cfc="taxinfo" mappedBy="contact">

	<cffunction name="getName" returnType="string">
		<cfreturn getLastName() & ", " & getFirstName()>
	</cffunction>

</cfcomponent>