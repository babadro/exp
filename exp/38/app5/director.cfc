<cfcomponent persistent="true" table="directors">

    <cfproperty name="directorid" fieldType="id" generator="increment">
    <cfproperty name="firstname" ormtype="string">
    <cfproperty name="lastname" ormtype="string"> 

</cfcomponent>