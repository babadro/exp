<!---
Name:        tab3.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Tabs with ajax magic
--->

<cflayout type="tab" tabheight="200">

    <cflayoutarea title="Tab One">
    <p>    
    This is the first tab.
    </>
    <form>
    Name: <input type="text" name="name"><br />
    Email: <input type="text" name="email"><br />
    <input type="submit">
    </form>
    </cflayoutarea>
    
    <cflayoutarea title="Tab Two" selected="true"
                  source="content1.cfm" />

    <cflayoutarea title="Tab Three" 
                  source="content1.cfm"
                  refreshOnActivate="true" />
    
</cflayout>