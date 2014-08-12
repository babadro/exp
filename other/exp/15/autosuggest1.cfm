<cfquery datasource="ows" name="ratings">SELECT Rating FROM FilmsRatings ORDER BY Rating</cfquery>

<cfset list=ValueList(ratings.Rating)>

<cfinclude template="header.cfm">

<cfform>
	<table align=>
</cfform>