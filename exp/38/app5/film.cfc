<cfcomponent persistent="true" table="films">

    <cfproperty name="id" column="filmid" fieldType="id" generator="increment">
    <cfproperty name="title" column="movietitle" ormtype="string">
    <cfproperty name="pitch" column="pitchtext" ormtype="string">
    <cfproperty name="budget" column="amountbudgeted" ormtype="float">
    <cfproperty name="summary" ormtype="text">
    <cfproperty name="image" column="imagename" ormtype="string">
	<cfproperty name="releasedate" column="dateintheaters" ormtype="date">

    <cfproperty name="expenses" fieldType="one-to-many" cfc="expense" fkcolumn="filmid" inverse="true">

    <cfproperty name="actors" fieldType="many-to-many" cfc="actor"
	linktable="filmsactors" fkcolumn="filmid" inversejoincolumn="actorid" singularname="actor">

    <cfproperty name="directors" fieldType="many-to-many" cfc="director"
    linktable="filmsdirectors" fkcolumn="filmid" inversejoincolumn="directorid" singularname="director">

</cfcomponent>