<html>
<head>
<script language="javascript">
//Boolean value tacking the window state.
var shown=true;
//Functions to display an alert box when
function onshow(name) {
alert("window shown = " + name);
}
function onhide(name) {
alert("window hidden = " + name);
}
//Initialize the window show/hide behavior.
function initWindow() {
ColdFusion.Window.onShow("testWindow", onshow);
ColdFusion.Window.onHide("testWindow", onhide);
}
//Show or hide the window, depending on its current state.
function toggleWindow() {
if (shown) {
ColdFusion.Window.hide("testWindow");
shown = false;
}
else {
ColdFusion.Window.show("testWindow");
shown = true;
}
}
</script>
</head>
<!-- The body tag onLoad event calls the window show/hide initializer function. -->
<body onLoad="initWindow()">
<cfwindow name="testWindow" initshow=true title="test window" closable=true> Window contents
</cfwindow>
<cfform>
<cfinput name="button" value="Toggle Window" onclick="javascript:toggleWindow()" type="button"/>
</cfform>
</body>
</html>