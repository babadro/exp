<cfcomponent output="false"
             alias="ows.35.example4.components.ACTORS">
   <cfproperty name="ACTORID" type="numeric" default="0">
   <cfproperty name="NAMEFIRST" type="string" default="">
   <cfproperty name="NAMELAST" type="string" default="">
   <cfproperty name="AGE" type="numeric" default="0">
   <cfproperty name="NAMEFIRSTREAL" type="string" default="">
   <cfproperty name="NAMELASTREAL" type="string" default="">
   <cfproperty name="AGEREAL" type="numeric" default="0">
   <cfproperty name="ISEGOMANIAC" type="numeric" default="0">
   <cfproperty name="ISTOTALBABE" type="numeric" default="0">
   <cfproperty name="GENDER" type="string" default="">

   <cfscript>
   // set the default values, 
   // notice that the case of the property doesn’t matter 
   this.actorid = 0;
   this.nameFirst = "";
   this.nameLast = "";
   this.age = 0;
   this.nameFirstRead = "";
   this.nameLastReal = "";
   this.ageReal = 0;
   this.isEgoManiac = 0;
   this.isTotalBase = 0;
   this.gender = "";
   </cfscript>

</cfcomponent>
