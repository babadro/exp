<h3>cfmodule Example</h3>
<p>This view-only example shows use of cfmodule to call a custom tag inline.</p>
<p>This example uses a sample custom tag that is saved in myTag.cfm in the snippets directory.
You can also save ColdFusion custom tags in the CFusionMX7\CustomTags directory.</p>
<cfset attrCollection1 = StructNew()>
<cfparam name="attrCollection1.value1" default="22">
<cfparam name="attrCollection1.value2" default="45">
<cfparam name="attrcollection1.value3" default="88">
<!--- Call the tag with CFMODULE with Name--->
<cfmodule
Template="myTag.cfm"
X="3"
attributeCollection=#attrCollection1#
Y="4">
<!--- Show the code. --->
<HR size="2" color="#0000A0">
<P>Here is one way in which to invoke the custom tag, using the TEMPLATE attribute.</P>
<cfoutput>#HTMLCodeFormat(" <CFMODULE
Template=""myTag.cfm""
X=3
attributeCollection=##attrCollection1##
Y=4>")#
</cfoutput>
<p>The result: <cfoutput>#result#</cfoutput></p>
<!--- Call the tag with CFMODULE with Name.--->
<!---
<CFMODULE
Name="myTag"
X="3"
attributeCollection=#attrCollection1#
Y="4">
--->
<!--- Show the code. --->
<HR size="2" color="#0000A0">
<p>Here is another way to invoke the custom tag, using the NAME attribute.</p>
<cfoutput>#HTMLCodeFormat(" <CFMODULE
NAME='myTag'
X=3
attributeCollection=##attrCollection1##
Y=4>")#
</cfoutput>
<P>The result: <cfoutput>#result#</cfoutput></p>
<!--- Call the tag using the shortcut notation. --->
<!---
<CF_myTag
X="3"
attributeCollection=#attrCollection1#
Y="4">
--->
<!--- Show the code. --->
<p>Here is the short cut to invoking the same tag.</p>
<cfoutput>#HTMLCodeFormat("<cf_mytag
x = 3
attributeCollection = ##attrcollection1##
y = 4>")#
</cfoutput>
<p>The result: <cfoutput>#result#</cfoutput></p>