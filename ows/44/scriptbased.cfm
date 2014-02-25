<!---
 Filename: scriptbased.cfm
 Created by: Raymond Camden
 Purpose: Simple example of script based error handling.
--->

<cfscript>

try {
    writeoutput("#x#");
} catch(any e) {
    throw(message="You did not define x!", detail="Hey, why didn't you define X?");
}

try {
    z = x+1;
} catch(any e) {
    rethrow;
}
</cfscript>