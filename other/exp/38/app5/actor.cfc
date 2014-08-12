<cfcomponent persistent="true" table="actors">

    <cfproperty name="actorid" fieldType="id" generator="increment">
    <cfproperty name="firstname" column="namefirst" ormtype="string">
    <cfproperty name="lastname" column="namelast" ormtype="string">
    <cfproperty name="age" ormtype="integer">

</cfcomponent>