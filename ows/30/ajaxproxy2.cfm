<!---
Name:        ajaxproxy2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: AjaxProxy example
--->

<cfajaxproxy cfc="proxytest2" jsclassname="proxytest">

<script>
var myProxy = new proxytest();
myProxy.setErrorHandler(handleError);
myProxy.setCallbackHandler(handleResult);


function handleResult(result) {
    alert(result);
}

function handleError(code,msg) {
    alert('Status Code: '+code+'\n'+'Message: '+msg);
}

function runProxy() {
    var name = document.getElementById("name").value;
    var result = myProxy.sayHello(name);
}
</script>

<form>
<input type="text" id="name"> 
<input type="button" onclick="runProxy()" 
       value="Run Proxy">
</form>