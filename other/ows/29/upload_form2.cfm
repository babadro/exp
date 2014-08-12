<hr>
<form action="" method="post" enctype="multipart/form-data">
	<table width="597" border="0">
      <tr>
        <td>Provide new image for:
          <!--- DROPDOWN LIST OF USERS --->
          <select name="contactid">
            <cfoutput query="get_users">
              <option value="#contactid#">#firstname# #lastname#</option>
            </cfoutput>
          </select></td>
        <td><input type="file" name="fileToUpload" /></td>
      </tr>
      <tr><!--- CFIMAGE being used to create a CAPTCHA image --->
        <td>
		<cfimage action="captcha" fontsize="25"
        text="#captchaText#" difficulty="low" 
		fonts="Arial,Courier New,Courier"
        width="250" height="40"/>
		</td>
        <td>
          <label>
        <input name="captchaTextField" value="type CAPTCHA here" type="text" id="captchaTextField" size="20" />
        </label>
          <!--- SUBMIT BUTTON --->
          <button type="submit">Upload</button></td>
      </tr>
    </table>

</form>
<hr>
