<cfcomponent>
	
<cffunction name="onApplicationStart" returntype="boolean" output="false">
		<cfset APPLICATION.bontSizeRangeList = "36/3.5,37/4.5,38/5,39/6,40/6.5,40.5/7,41/7.5,42/8,43/9,44/10,44.5/10.5,45/10.75,46/11,46.5/11.5,47/12,48/12.5,49/13,50/14">
		<cfset APPLICATION.bontSizeRange = {"36" = "3.5",
											"37" = "4.5",
											"38" = "5",
											"39" = "6",
											"40" = "6.5",
											"40.5" = "7",
											"41" = "7.5",
											"42" = "8",
											"43" = "9",
											"44" = "10",
											"44.5" = "10.5",
											"45" = "10.75",
											"46" = "11",
											"46.5" = "11.5",
											"47" = "12",
											"48" = "12.5",
											"49" = "13",
											"50" = "14"}>
		<cfreturn True>
</cffunction>	

</cfcomponent>