<!---
Name:        layout3.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic layout
--->

<cflayout type="border">

    <cflayoutarea position="left" align="center" 
            size="400" collapsible="true" title="Menu">
    <p>
    Menu 1
    </p>
    <p>
    Menu 2
    </p>
    <p>
    Menu 3
    </p>
    </cflayoutarea>

    <cflayoutarea position="right" collapsible="true">
    <p>
    This area can be collapsed.
    </p>
    </cflayoutarea>

    <cflayoutarea position="top" size="100" 
                  splitter="true" minsize="50">
    <p>
    This area can be resized, but has a minsize of 50
    </p>
    </cflayoutarea>

    <cflayoutarea position="center">
    <p>
    CENTER
    </p>
    </cflayoutarea>
    
</cflayout>
