<cfcomponent persistent="true">

    <cfproperty name="taxinfoid" fieldType="id" generator="increment" type="numeric">
    <cfproperty name="ssn" ormtype="string">
    <cfproperty name="legaluscitizen" ormtype="boolean">
    <cfproperty name="numberofdependants" ormtype="integer">
    <cfproperty name="contact" fieldtype="one-to-one" cfc="contact" fkcolumn="contactid">

</cfcomponent>