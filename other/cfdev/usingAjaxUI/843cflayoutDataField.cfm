<html>
<head>
</head>
<body>
<cflayout type="tab" tabheight="250px" style="width:400px;">
<cflayoutarea title="test" overflow="visible">
<br>
<cfform name="mycfform1">
<div style="float:left;">Date 1: </div>
<cfinput type="datefield" name="mydate1"><br><br><br>
<div style="float:left;">Date 2: </div>
<cfinput type="datefield" name="mydate2" value="15/1/2007"><br><br><br>
<div style="float:left;">Date 3: </div>
<cfinput type="datefield" name="mydate3" required="yes"><br><br><br>
<div style="float:left;">Date 4: </div>
<cfinput type="datefield" name="mydate4" required="no"><br><br><br>
</cfform>
</cflayoutarea>
<cflayoutarea title="Mask" overflow="visible">
<cfform name="mycfform2">
<br>
<div style="float:left;">Date 1: </div>
<cfinput type="datefield" name="mydate5" mask="dd/mm/yyyy">
(dd/mm/yyyy)<br><br><br>
<div style="float:left;">Date 2: </div>
<cfinput type="datefield" name="mydate6" mask="mm/dd/yyyy">
(mm/dd/yyyy)<br><br><br>
<div style="float:left;">Date 3: </div>
<cfinput type="datefield" name="mydate7" mask="d/m/yy">
(d/m/yy)<br><br><br>
<div style="float:left;">Date 4: </div>
<cfinput type="datefield" name="mydate8" mask="m/d/yy">
(m/d/yy)<br><br><br>
</cfform>
</cflayoutarea>
</cflayout>
</body>
</html>