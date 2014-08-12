<!---
Name:        ajaxproxy3.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: AjaxProxy example
--->

<cfajaxproxy
        bind="cfc:proxytest2.sayHello({name@keyup})" 
        onError="handleError" 
        onSuccess="handleResult">

<script>
function handleResult(result) {
    document.getElementById("result").innerHTML = result;
}

function handleError(code,msg) {
    alert('Status Code: '+code+'\n'+'Message: '+msg);
}
</script>

<form>
<input type="text" id="name"> 
</form>

<div id="result" />