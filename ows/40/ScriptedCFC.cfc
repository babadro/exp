// Author: Charlie Arehart -- carehart.org
// This is a demonstration of a CFC written entirely in CFSCRIPT

component  displayname="scriptedCFC" hint="I am a scripted CFC" output="false"
{
   property name="AProperty" type="string" hint="I am a property" default="test";

   public string function GetData( string fname="Bob" ) description="I return data" output="false"
   {
      //note that if you create any local variables, use var!
      var somevariable="somevalue";
      return "Hi #arguments.fname#";
   }
}