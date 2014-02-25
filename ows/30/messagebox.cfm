<!---
Name:        messagebox.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic messagebox examples.
--->

<cfmessagebox name="mb1" type="alert" title="Danger!" 
message="This operation will result in the end of the world!">

<cfmessagebox name="mb2" type="confirm" title="Are you sure?" 
message="This requires smarts - and - um - not too sure about you.">

<cfmessagebox name="mb3" type="prompt" title="Desired Username" 
message="Enter your desired username." callbackhandler="getPrompt">

<input type="button" onclick="ColdFusion.MessageBox.show('mb1')" 
       value="Show Alert"><br/>
<input type="button" onclick="ColdFusion.MessageBox.show('mb2')" 
       value="Show Confirm"><br/>
<input type="button" onclick="ColdFusion.MessageBox.show('mb3')" 
       value="Show Prompt">

<script>
var getPrompt = function(btn,message){
alert("You entered: "+message);
}
</script>

