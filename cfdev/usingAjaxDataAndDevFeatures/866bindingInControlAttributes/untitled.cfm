<html>
<head>
</head>
<body>
<cfform name="myform">
Pick one:
<cfinput id="pickers1" name="pickone" type="radio" value="Apples">
<label for="pickers1">Apples</label>
<cfinput id="pickers2" name="pickone" type="radio" value="Oranges">
<label for="pickers2">Oranges</label>
<cfinput id="pickers3" name="pickone" type="radio" value="Mangoes">
<label for="pickers3">Mangoes</label>
<br>
<cfinput name="pickone-selected" bind="{pickone}"><br />
<br />
Pick as many as you like:
<cfinput id="pickers4" name="pickmany" type="checkbox" value="Apples">
<label for="pickers4">Apples</label>
<cfinput id="pickers5" name="pickmany" type="checkbox" value="Oranges">
<label for="pickers5">Oranges</label>
<cfinput id="pickers6" name="pickmany" type="checkbox" value="Mangoes">
<label for="pickers6">Mangoes</label>
<br/>
<cfinput name="pickmany-selected" bind="{pickmany}"><br />
</cfform>
</body>
</html>