<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<h3>Atab</h3>
<cflayout type="tab" name="thelayout" tabheight="175" style="background-color:##CCffFF;
color:red; height:200">
<cflayoutarea title="Tab 1" style="background-color:##FFAAFF;" closable="true">
This is text in layout area 1
</cflayoutarea>
<cflayoutarea name="area2" title="Tab 2" inithide="true"
style="background-color:##FFCCFF" >
This is text in layout area 2
</cflayoutarea>
<cflayoutarea title="Tab 3" style="background-color:##FF99FF;">
This is text in layout area 3
</cflayoutarea>
</cflayout>
<br />
<cfform>
<cfinput name="show" width="40" value="show tab" type="button"
onClick="ColdFusion.Layout.showTab('thelayout', 'area2');">
<cfinput name="hide" width="40" value="hide tab" type="button"
onClick="ColdFusion.Layout.hideTab('thelayout', 'area2');">
<cfinput name="enable" width="40" value="enable tab" type="button"
onClick="ColdFusion.Layout.enableTab('thelayout', 'area2');">
<cfinput name="disable" width="40" value="disable tab" type="button"
onClick="ColdFusion.Layout.disableTab('thelayout', 'area2');">
<cfinput name="select" width="40" value="select tab" type="button"
onClick="ColdFusion.Layout.selectTab('thelayout', 'area2');">
</cfform>
</body>
</html>