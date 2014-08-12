<!--- 
  FileName: serialize.cfm
  Author: Ken Fricklas (KF)
  Purpose: Implement a distributed, serialized system
--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Serialize CFC</title>
</head>

<body>
<cfapplication sessionmanagement="yes" name="serialdemo">
<cfif not isdefined("session.cfcDirector")>
   <!--- check to see if we've got a copy --->
    <cftry>
       <cfset fileIn = CreateObject("java", "java.io.FileInputStream")>
         <cfset fileIn.init(expandpath("./serialized_director.txt"))>
         <cfset objIn = CreateObject("java", "java.io.ObjectInputStream")>
         <cfset objIn.init(fileIn)>
         <cfset session.cfcDirector = objIn.readObject()>
         Read!
        <cfcatch>
            <!--- no copy to load, create it --->
            <cfset session.cfcDirector = createObject("component", "director")>
            <!--- save it --->
            <cfset fileOut = CreateObject("java", "java.io.FileOutputStream")>
            <cfset fileOut.init(expandpath("./serialized_director.txt"))>
            <cfset objOut = CreateObject("java", "java.io.ObjectOutputStream")>
            <cfset objOut.init(fileOut)>
            <cfset objOut.writeObject(session.cfcDirector)>
            Written!
        </cfcatch>
    </cftry>
</cfif>
<cfoutput>
   #session.cfcDirector.showPerson()#
</cfoutput>
</body>
</html>
