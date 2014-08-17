<!---
Name:        tab2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic tabs
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
    
    <cflayoutarea title="Tab Two" selected="true">
        <cfloop index="x" from="1" to="10">
        <p>
        This is the second tab.
        </p>
        </cfloop>
    </cflayoutarea>

    <cflayoutarea title="Tab Three" disabled="true">
        <p>
        This tab content won't be shown.
        </p>
    </cflayoutarea>
    
</cflayout>