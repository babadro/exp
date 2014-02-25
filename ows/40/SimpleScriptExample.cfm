<!--- Author: Charlie Arehart -- carehart.org 
	A simple demonstration of assigment using tags and then scripting --->

<!--- Tag-based assignment --->
<cfset person=structnew()>
<cfset person.fname="Bob">
<cfset person.lname="Smith">
<cfset person.children=arraynew(1)>
<cfset person.children[1]="Sally">
<cfset person.children[2]="Jimmy">
<cfdump var="#person#">

<cfscript>
   // script-based assignment
   person={fname="Bob",lname="Smith",children=["Sally","Jimmy"]};
   writedump(person);
</cfscript>