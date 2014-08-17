<html>
<head>
<!--- The cfajaximport tag is required for the submitForm function to work
because the page does not have any Ajax-based tags. --->
<cfajaximport>
<script>
function submitForm() {
ColdFusion.Ajax.submitForm('myform', 'asyncFormHandler.cfm', callback,
errorHandler);
}
function callback(text)
{
alert("Callback: " + text);
}
function errorHandler(code, msg)
{
alert("Error!!! " + code + ": " + msg);
}
</script>
</head>
<body>
<cfform name="myform">
<cfinput name="mytext1"><br />
<cfinput name="mytext2">
</cfform>
<a href="javascript:submitForm()">Submit form</a>
</body>
</html>