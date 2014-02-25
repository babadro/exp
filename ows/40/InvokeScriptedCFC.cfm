<!--- Author: Charlie Arehart -- carehart.org 
	Invoking a scripted CFC, using both old and new ways --->

<cfinvoke component="scriptedcfc" method="GetData" fname="Jim" returnvariable="get">
<cfoutput>#get#</cfoutput><br>

<cfobject component="scriptedcfc" name="scripted">
<cfset scripts=createobject("component","scriptedcfc")>

<cfoutput>#scripted.GetData(fname="Jane")#</cfoutput><br>

<cfscript>
	scripted=createobject("component","scriptedcfc");
	writeoutput(scripted.GetData(fname="Sally") & '<br>');
	
	scripted=new scriptedcfc();
	writeoutput(scripted.GetData(fname="Bill") & '<br>');
</cfscript>

<!--- Of course we wouldn't normally create an instance of
the CFC over and over, even if we wanted to call its method(s) multiple times.
But we did that in this case to focus on the code for instantiating CFCs and 
invoking their methods different ways. --->