<!---
Name:        accordion1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic accordion
--->

<cflayout type="accordion">

  <cflayoutarea title="Panel One">
  <p>  
  This is the first panel.
  </>
  <form>
  Name: <input type="text" name="name"><br />
  Email: <input type="text" name="email"><br />
  <input type="submit">
  </form>
  </cflayoutarea>
  
  <cflayoutarea title="Panel Two">
    <cfloop index="x" from="1" to="10">
    <p>
    This is the second panel.
    </p>
    </cfloop>
  </cflayoutarea>
  
</cflayout>