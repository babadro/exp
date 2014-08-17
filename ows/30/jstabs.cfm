<!---
Name:        jstabs.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: JS Api Example
--->

<cflayout type="tab" tabheight="200" name="tabs">

    <cflayoutarea title="Tab One" name="tab1">
    <p>    
    This is the first tab.
    </p>
    </cflayoutarea>
    
    <cflayoutarea title="Tab Two" name="tab2">
    <p>    
    This is the second tab.
    </p>
    </cflayoutarea>

</cflayout>

<p>
<a href = "" 
onClick="ColdFusion.Layout.selectTab('tabs','tab1');
return false;">select tab 1</a> / 
<a href = "" 
onClick="ColdFusion.Layout.selectTab('tabs','tab2');
return false;">select tab 2</a>
</p> 

<p>
<a href = ""
onClick="ColdFusion.Layout.enableTab('tabs','tab2');
return false;">enable tab2</a> /
<a href = ""
onClick="ColdFusion.Layout.disableTab('tabs','tab2');
return false;">disable tab2</a>