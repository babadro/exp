<cfscript>
   /* Author: Charlie Arehart -- carehart.org
      Performs the equivalent of CFQUERY against the Actors table */

   queryService = new query(); 
   // see the chapter for other ways to initalize the CFC

   queryService.setDatasource("ows"); 
   queryService.setName("GetActors");
   // see the chapter for other ways to set the properties

   // Can add the equivalent of more attributes, such as CachedWithin 

   queryService.setcachedwithin(CreateTimeSpan(0, 6, 0, 0));
 
   // You can also add the equivalent of cfqueryparams, using addParam 

   /* the first example uses a name-value pair to provide an age=40 value 
      for the :age indication in the SQL statement */

   queryService.addParam(name="age",value="40",cfsqltype="numeric"); 

   /* the second example uses an unnamed parameter for the first ? 
      indicator in the SQL statement, providing the value 'M' for 
	  the gender column in the where clause */
   
   queryService.addParam(value="M",cfsqltype="cf_sql_varchar");
   
   result = queryService.execute(
      sql="SELECT namefirst, namelast, age, gender 
	  FROM Actors WHERE age >= :age and gender = ? 
	  ORDER BY namelast, namefirst ");
   
   GetActors = result.getResult();
    
   // getPrefix() returns query resultset metadata, 
   // including the query parameters (as sqlparameters)
    
   metaInfo = result.getPrefix(); 
   
   writeoutput("<h4>Found #metaInfo.recordcount# records for actors 
      with age>='#metainfo.sqlparameters[1]#' and 
	  gender='#metainfo.sqlparameters[2]#</h4>"); 
   
   // you can loop over the query by treating each row as an array element

   for(i=1;i <=GetActors.recordcount;i++) {
      writeoutput(getactors.namefirst[i] & getactors.namelast[i] 
	  & '<br>');
   }
   
   writedump(GetActors);

   // note that while the GetActors dump does not show recordcount, 
   // you can use it

   writedump(metaInfo);

   // and while the GetActors dump does show sqlparameters, you can't 
   // use it and must use the output of getPrefix

</cfscript> 