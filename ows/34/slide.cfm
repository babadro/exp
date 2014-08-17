<!---
Name:        slide.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Content for a slide
--->

<cfoutput>
This will show up inside the slide.<br />
The date is #dateFormat(now(), "long")# and the time is
#timeFormat(now(), "long")#.
</cfoutput>