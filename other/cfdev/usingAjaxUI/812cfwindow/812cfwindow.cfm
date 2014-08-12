<html>
<head>
<script>
<!--
//Configuration parameters for window 2.
var config =
{x:250,y:300,height:300,width:300,modal:false,closable:false,
draggable:true,resizable:true,initshow:false,minheight:200,minwidth:200
}
-->
</script>
</head>
<body>
<!--- Create a window with a title and show it. Don't allow dragging or resizing. --->
<cfwindow name="window1" title="CFML Window" draggable="false"
resizable="false" initshow="true" height="250" width="250" x=375 y=0>
<p>
This content was defined in the cfwindow tag body.
</p>
</cfwindow><br />
<form>
<!--- Use the API to show and hide Window 1. --->
<input type="button" value="Show Window1"
onClick="ColdFusion.Window.show('window1')">
<input type="button" value="Hide Window1"
onClick="ColdFusion.Window.hide('window1')"><br />
<!--- Use the API to create, show, and hide Window 2 --->
<input type="button" value="Create Window2"
onClick="ColdFusion.Window.create('window2', 'JavaScript Window',
'window2.cfm', config)">
<input type="button" value="Show Window2"
onClick="ColdFusion.Window.show('window2')">
<input type="button" value="Hide Window2"
onClick="ColdFusion.Window.hide('window2')">
</form>
</body>
</html>