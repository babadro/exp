<html>
<head>
</head>
<body>
<!--- The selected function changes the text in the selectedItemLabel div block to show the
selected item. --->
<script type="text/javascript">
function selected(item) {
var el = document.getElementById("selectedItemLabel");
el.innerHTML = "You selected: " + item;
}
</script>
<!--- A horizontal menu with nested submenus. Clicking an end item calls the selected
function. --->
<cfmenu name="hmenu" bgcolor="##9999ff" selectedfontcolor="##0000dd"
selecteditemcolor="##ddddff">
<cfmenuitem display="Home" href="javascript:selected('Home');" />
<cfmenuitem display="File">
<cfmenuitem display="Open...">
<cfmenuitem display="Template" href="javascript:selected('File &gt;
Open... &gt; Template');" />
<cfmenuitem divider="true" />
<cfmenuitem display="CSS" href="javascript:selected('File &gt; Open... &gt;
CSS');" />
</cfmenuitem>
<cfmenuitem display="Close" href="javascript:selected('File &gt; Close');" />
</cfmenuitem>
<cfmenuitem display="Help">
<cfmenuitem display="About" href="javascript:selected('Help &gt; About');" />
</cfmenuitem>
</cfmenu>
<!--- A div with initial text.
The selected function changes the text by resetting the innerHTML. --->
<div style=" margin-top: 100; margin-left: 10;"><span id="selectedItemLabel">
Please select an item!</span></div>
</body>
</html>