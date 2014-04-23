<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<cflayout type="vbox" name="layout1">
<cflayoutarea>
<h3>This area is not refreshed when the form is submitted.</h3>
<br />
</cflayoutarea>
<cflayoutarea>
<h3>This form is replaced by the action page</h3>
<cfform name="myform" format="html" action="showName.cfm">
<cfinput type = "Text" name = "name">
<cfinput type = "submit" name = "submit" value = "Enter name">
</cfform>
</cflayoutarea>
</cflayout>
</body>
</html>