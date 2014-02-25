<!---
Name:        menu2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Horizontal menu
--->

<cfmenu type="horizontal" bgcolor="##fffba0" 
        selectedItemColor="##e7d844">

    <cfmenuitem display="Products">
        <cfmenuitem display="Books" 
                    href="products/books.cfm" />
        <cfmenuitem display="Music" 
                    href="products/music.cfm" />
        <cfmenuitem display="Movies" 
                    href="products/movies.cfm" />
        <cfmenuitem display="Video Games" 
                    href="products/vidgames.cfm" />
        <cfmenuitem display="Weapons of Mass Destruction" 
                    href="products/womd.cfm" />            
    </cfmenuitem>

    <cfmenuitem display="Services">
        <cfmenuitem display="Car Washing" 
                    href="services/car.cfm" />
        <cfmenuitem display="Car Tuning" 
                    href="services/tuneup.cfm" />
        <cfmenuitem display="Starship Construction" 
                    href="services/starship.cfm" />
    </cfmenuitem>

    <cfmenuitem display="Our People">
        <cfmenuitem display="Entertainment">
            <cfmenuitem display="Abba Jones" 
                        href="people/aj.cfm" />
            <cfmenuitem display="Jacob Camden" 
                        href="people/jc.cfm" />
        </cfmenuitem>    
    
        <cfmenuitem divider />

        <cfmenuitem display="Finances">
            <cfmenuitem display="Jeanne Camden" 
                        href="people/jc2.cfm" />
            <cfmenuitem display="Charlie Griefer" 
                        href="people/sd.cfm" />
        </cfmenuitem>    

        <cfmenuitem divider />

        <cfmenuitem display="Security">
            <cfmenuitem display="Alfonse Albertorinia" 
                        href="people/aa.cfm" />
            <cfmenuitem display="Lynn Camden" 
                        href="people/lc.cfm" />
            <cfmenuitem display="Noah Camden" 
                        href="people/nc.cfm" />
        </cfmenuitem>    
    </cfmenuitem>
</cfmenu>