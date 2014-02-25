
<cfimage
    action = "resize"
    height = "25%"
    source = "#ExpandPath( './Black_scorpion.jpg' )#"
    width = "25%"
    destination = "#ExpandPath( './NewBlack_scorpion.jpg' )#"
    overwrite = "true"
	>
	
	
<p>&nbsp;</p>
<table width="200" border="1">
  <tr>
    <td><img src="Black_scorpion.jpg"></td>
    <td><img src="NewBlack_scorpion.jpg"></td>
  </tr>
  <tr>
    <td><div align="center">Old Image</div></td>
    <td><div align="center">New Image</div></td>
  </tr>
</table>
<p>&nbsp;</p>