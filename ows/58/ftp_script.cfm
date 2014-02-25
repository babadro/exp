<cfscript>
ftpService = new ftp();

//set attributes
ftpService.setUsername("anonymous");
ftpService.setPassword("");
ftpService.setServer("ftp.mozilla.org");
ftpService.setStopOnError(true);
ftpService.setConnection("moz");

//open it
ftpService.open();

//change directory
ftpService.changeDir(directory="/pub/mozilla.org");

//get current directory
result = ftpService.getCurrentDir();
currentDir = result.getPrefix().returnValue;
writeOutput("Current directory on FTP connection: #currentDir# <p/>");

//get the files
result = ftpService.listDir(directory=currentDir,name="files");
writeDump(result.getResult());

//close the connection
ftpService.close(connection="moz");
</cfscript>
