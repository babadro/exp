<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<!--- The tabheight attribute sets the height of all tab content areas and therefore the
layout height. The width style controls the layout width. --->
<cflayout type="tab" name="mainTab" tabheight="300px" style="width:400px">
<!--- Each layoutarea is one tab. --->
<cflayoutarea title="First Tab" name="tab1">
<h2>The First Tab</h2>
<p>
Here are the contents of the first tab.
</p>
</cflayoutarea>
<cflayoutarea title="Second Tab" name="tab2">
<h2>The Second Tab</h2>
<p>
This is the content of the second tab.
</p>
</cflayoutarea>
</cflayout>
<p>
Use these links to test selecting tabs via JavaScript:<br />
<a href="" onClick="ColdFusion.Layout.selectTab('mainTab','tab1');return false;">
Click here to select tab 1.</a><br />
<a href="" onClick="ColdFusion.Layout.selectTab('mainTab','tab2');return false;">
Click here to select tab 2.</a><br />
</p>
<p>
Use these links to test disabling/enabling via JavaScript. Notice that you cannot disable
the currently selected tab.<br />
<a href="" onClick="ColdFusion.Layout.enableTab('mainTab','tab1');return false;">
Click here to enable tab 1.</a><br />
<a href="" onClick="ColdFusion.Layout.disableTab('mainTab','tab1');return false;">
Click here to disable tab 1.</a><br />
</p>
</body>
</html>