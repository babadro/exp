<cfcomponent persistent="true" alias="ows.32.example1.components.model.Actors">
	<cfproperty name="actorId" column="ACTORID" sqltype="Integer"/>
	<cfproperty name="nameFirst" column="NAMEFIRST" sqltype="String"/>
	<cfproperty name="nameLast" column="NAMELAST" sqltype="String"/>
	<cfproperty name="age" column="AGE" sqltype="Integer"/>
	<cfproperty name="nameFirstReal" column="NAMEFIRSTREAL" sqltype="String"/>
	<cfproperty name="nameLastReal" column="NAMELASTREAL" sqltype="String"/>
	<cfproperty name="ageReal" column="AGEREAL" sqltype="Integer"/>
	<cfproperty name="isEgoManiac" column="ISEGOMANIAC" sqltype="Integer"/>
	<cfproperty name="isTotalBabe" column="ISTOTALBABE" sqltype="Integer"/>
	<cfproperty name="gender" column="GENDER" sqltype="Char"/>
</cfcomponent>