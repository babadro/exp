<html>
<head>
</head>
<body>
<cfform name="mycfform">
First Name: <cfinput type="text" name="firstname" value=""><br>
Last Name: <cfinput type="text" name="lastname" value=""><br>
Domain: <cfinput type="text" name="domain" value=""><br>
E-mail: <cfinput type="text" name="email1" size="30"
bind="{firstname}.{lastname}@{domain}">
</cfform>
</body>
</html>