<!--- 
 Filename: dopostrequest.cfm
 Purpose: Handle a post request
--->

<cfoutput>
The following variables were POSTED here.
<p>
Form_Test: #Form.form_test#<br>
URL_Test: #URL.url_test#<br>
CGI_Test: #CGI.cgi_test#<br>
Cookie_Test: #COOKIE.cookie_test#<br>
FileName: #form.filename#<br>
</cfoutput>

<p/>
The HTTP Request Data is the following:
<cfdump var="#GetHttpRequestData()#">
