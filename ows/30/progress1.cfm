<!---
Name:        progress1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Simple, static progress bar
--->

<html>
<head>
<script>
function startIt() {
    ColdFusion.ProgressBar.start('mybar');
}

function showDone() {
    ColdFusion.MessageBox.create('mymb','alert','Progress Done','All Done!');
    ColdFusion.MessageBox.show('mymb');
}
</script>
</head>

<body>
<h2>Stand by - this will take a while...</h2>

</body>
</html>

<!--- Duration is in miliseconds. --->
<!--- So do some simple math to make it easier. --->
<cfset dur = 5 * 1000>
<cfprogressbar name="mybar" duration="#dur#" oncomplete="showDone">

<cfset ajaxOnLoad("startIt")>
<cfajaximport tags="cfmessagebox">