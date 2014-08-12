<!--- 
 Filename: zipparam.cfm
 Edited By: Raymond Camden
--->

<cfset zipFile = expandPath("./zp.zip")>

<cfzip file="#zipFile#" action="zip">
	<cfzipparam content="#repeatString('Simple Text',999)#" 
				entrypath="simple.txt">
	<cfzipparam source="#expandPath('./unzip.cfm')#" 
				entrypath="/sub/unzipfile.cfm">	 
</cfzip>

<cfzip file="#zipFile#" action="list" name="files"> 

<cfdump var="#files#">