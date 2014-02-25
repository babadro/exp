<!---
Name:        ajaxproxy1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: AjaxProxy example
--->

<cfajaxproxy cfc="proxytest" jsclassname="proxytest">

<script>
var myProxy = new proxytest();

function runProxy() {
    var name = document.getElementById("name").value;
    var result = myProxy.sayHello(name);
    alert(result);
}
</script>

<form>
<input type="text" id="name"> 
<input type="button" onclick="runProxy()" 
       value="Run Proxy">
</form>