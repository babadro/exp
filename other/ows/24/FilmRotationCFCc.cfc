<!--- 
 Filename: FilmRotationCFCc.cfc
 Author: Nate Weiss (NMW)
 Purpose: Creates FilmRotationCFC, a ColdFusion Component
--->

<cfcomponent output="false">

  <cfproperty name="currentListPos" hint="current position in list" type="numeric">
  <cfproperty name="filmList" hint="randomized list of films" type="string">
  <cfproperty name="rotationInterval" hint="how often the film rotates, in seconds" type="numeric">
  <cfproperty name="currentUntil" hint="when does this film expire, and the next in the list becomes current" type="date">
  <!--- *** begin initialization code *** --->

  <!--- init method --->
  <cffunction name="init" returntype="component" hint="initialization">
    <cfargument name="datasource" required="yes" type="string">
    <cfargument name="rotationInterval" required="no" default="5" type="numeric">
    <cfset THIS.rotationInterval = arguments.rotationInterval>
    <cfset variables.dsn = arguments.datasource>
    <cfset THIS.filmList = randomizedFilmList()>
    <cfset THIS.currentListPos = 1>
    <cfset THIS.currentUntil = dateAdd("s", THIS.rotationInterval, now())>
	<cfreturn this>
  </cffunction>
  <!--- *** end initialization code *** --->
  <!--- Private function: RandomizedFilmList() ---> 
  <cffunction name="randomizedFilmList" returnType="string" access="private"
  output="false"
  hint="For internal use. Returns a list of all Film IDs, in random order.">
  
    <!--- This variable is for this function's use only --->
    <cfset var getFilmIDs = "">
    
    <!--- Retrieve list of current films from database --->
    <cfquery name="getFilmIDs" datasource="#variables.dsn#" 
    cachedwithin="#CreateTimeSpan(0,1,0,0)#">
    SELECT FilmID FROM Films
    ORDER BY MovieTitle
    </cfquery>
    
    <!--- Return the list of films, in random order --->
    <cfreturn listRandomize(valueList(getFilmIDs.FilmID))>
  </cffunction>

  <!--- Private utility function: ListRandomize() --->
  <cffunction name="listRandomize" returnType="string"
  output="false"
  hint="Randomizes the order of the items in any comma-separated list.">
  
    <!--- List argument --->
    <cfargument name="list" type="string" required="Yes"
    hint="The string that you want to randomize.">
    
    <!--- These variables are for this function's use only ---> 
    <cfset var result = "">
    <cfset var randPos = "">
    
    <!--- While there are items left in the original list... --->
    <cfloop condition="listLen(ARGUMENTS.list) gt 0">
      <!--- Select a list position at random --->
      <cfset randPos = randRange(1, listLen(ARGUMENTS.list))>
      <!--- Add the item at the selected position to the Result list --->
      <cfset result = listAppend(result, listGetAt(ARGUMENTS.list, randPos))>
      <!--- Remove the item from selected position of the original list --->
      <cfset ARGUMENTS.list = listDeleteAt(ARGUMENTS.list, randPos)>
    </cfloop>
    
    <!--- Return the reordered list ---> 
    <cfreturn result>
  </cffunction> 

  <!--- Private method: IsFilmNeedingRotation() --->
  <cffunction name="isFilmNeedingRotation" access="private" returnType="boolean"
  output="false"
  hint="For internal use. Returns TRUE if the film should be rotated now.">
  
    <!--- Compare the current time to the THIS.CurrentUntil time --->
    <!--- If the film is still current, DateCompare() will return 1 --->
    <cfset var dateComparison = dateCompare(THIS.currentUntil, now())>
    
    <!--- Return TRUE if the film is still current, FALSE otherwise --->
    <cfreturn dateComparison neq 1>
  </cffunction> 

  <!--- RotateFilm() method ---> 
  <cffunction name="rotateFilm" access="private" returnType="void" output="false" 
  hint="For internal use. Advances the current movie.">
  
    <!--- If the film needs to be rotated at this time... ---> 
    <cfif isFilmNeedingRotation()>
      <!--- Advance the instance-level THIS.CurrentListPos value by one --->
      <cfset THIS.currentListPos = THIS.currentListPos + 1>
    
      <!--- If THIS.CurrentListPos is now more than the number of films, --->
      <!--- Start over again at the beginning (the first film) --->
      <cfif THIS.currentListPos gt listLen(THIS.FilmList)>
        <cfset THIS.currentListPos = 1>
      </cfif>
    
      <!--- Set the time that the next rotation will be due --->
      <cfset THIS.currentUntil = dateAdd("s", THIS.rotationInterval, now())>
    </cfif>
  </cffunction>

  <!--- Private method: CurrentFilmID() --->
  <cffunction name="currentFilmID" access="private" returnType="numeric"
  output="false"
  hint="For internal use. Returns the ID of the current film in rotation.">
  
    <!--- Return the FilmID from the current row of the GetFilmIDs query --->
    <cfreturn listGetAt(THIS.filmList, THIS.currentListPos)>
  </cffunction> 

  <!--- Public method: GetCurrentFilmID() --->
  <cffunction name="getCurrentFilmID" access="public" returnType="numeric"
  output="false"
  hint="Returns the ID number of the currently 'featured' film.">
    <!--- First, rotate the current film --->
    <cfset rotateFilm()>
    
    <!--- Return the ID of the current film --->
    <cfreturn currentFilmID()>
  </cffunction>

  <!--- Public method: GetCurrentFilmData() --->
  <cffunction name="getCurrentFilmData" access="remote" returnType="struct"
  output="false"
  hint="Returns structured data about the currently 'featured' film.">
  
    <!--- This variable is local just to this function --->
    <cfset var currentFilmData = "">
    
    <!--- Invoke the GetCurrentFilmID() method (in separate component) --->
    <!--- Returns a structure with film's title, summary, actors, etc. --->
    <cfinvoke component="FilmDataCFC2" method="getFilmData"
    filmID="#getCurrentFilmID()#" returnVariable="currentFilmData">
    
    <!--- Return the structure ---> 
    <cfreturn currentFilmData> 
  </cffunction>

  <!--- getter method for rotationInterval --->
  <cffunction name="getrotationInterval" returntype="numeric" hint="getter for rotationInterval property">
  	<cfreturn this.currentUntil>
  </cffunction>

  <!--- setter method for rotationInterval --->
  <cffunction name="setrotationInterval" returntype="void" hint="setter for rotationInterval property">
  	<cfargument name="newValue" required="yes" type="numeric" hint="new value for rotationInterval property">
	<cfif isNumeric(arguments.newValue)>
		<cfset this.currentUntil = arguments.newValue>
	<cfelse>
		<cfthrow type="application" message="Invalid value for setrotationInterval: must be numeric"> 
	</cfif>
  	<cfreturn>
  </cffunction>
</cfcomponent>
