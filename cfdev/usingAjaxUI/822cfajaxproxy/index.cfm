<html>
<head>
<script type="text/javascript">
function doLogin() {
// Create the Ajax proxy instance.
var auth = new AuthenticationSystem();
// setForm() implicitly passes the form fields to the CFC function.
auth.setForm("loginForm");
//Call the CFC validateCredentials function.
if (auth.validateCredentials()) {
ColdFusion.Window.hide("loginWindow");
} else {
var msg = document.getElementById("loginWindow_title");
msg.innerHTML = "Incorrect username/password. Please try again!";
}
}
</script>
</head>
<body>
<cfajaxproxy cfc="AuthenticationSystem" />
<cfif structKeyExists(URL,"logout") and URL.logout>
<cflogout />
</cfif>
<cflogin>
<cfwindow name="loginWindow" center="true" closable="false"
draggable="false" modal="true"
title="Please login to use this system"
initshow="true" width="400" height="200">
<!--- Notice that the form does not have a submit button.
Submit action is performed by the doLogin function. --->
<cfform name="loginForm" format="xml">
<cfinput type="text" name="username" label="username" /><br />
<cfinput type="password" name="password" label="password" />
<cfinput type="button" name="login" value="Login!" onclick="doLogin();" />
</cfform>
</cfwindow>
</cflogin>
<p>
This page is secured by login.
You can see the window containing the login form.
The window is modal; so the page cannot be accessed until you log in.
<ul>
<li><a href="setForm.cfm">Continue using the application</a>!</li>
<li><a href="setForm.cfm?logout=true">Logout</a>!</li>
</ul>
</p>
</body>
</html>