<cfcomponent table="FILMS" persistent="true" alias="ows.32.example1.components.model.Films">
	<cfproperty name="filmId" column="FILMID" sqltype="Integer"  generator="increment"/>
	<cfproperty name="movieTitle" column="MOVIETITLE" sqltype="Text"/>
	<cfproperty name="pitchText" column="PITCHTEXT" sqltype="Text"/>
	<cfproperty name="amountBudgeted" column="AMOUNTBUDGETED" sqltype="Float"/>
	<cfproperty name="ratingId" column="RATINGID" sqltype="Integer"/>
	<cfproperty name="summary" column="SUMMARY" sqltype="Text"/>
	<cfproperty name="imageName" column="IMAGENAME" sqltype="Text"/>
	<cfproperty name="dateInTheaters" column="DATEINTHEATERS" sqltype="Timestamp"/>
</cfcomponent>