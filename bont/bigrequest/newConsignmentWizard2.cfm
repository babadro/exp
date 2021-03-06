<cfif not isDefined("SESSION.consWiz")>
	<cfset SESSION.consWiz = structNew()>
	<cfset SESSION.consWiz.invoice = "">
	<cfset SESSION.consWiz.expectArrival = "">
	<cfset SESSION.consWiz.factArrival = "">
	<cfset SESSION.consWiz.statusId = "">
	<cfset SESSION.consWiz.note = "">
</cfif>
<cfif isDefined("Form.invoice")><cfset SESSION.consWiz.invoice = FORM.invoice></cfif>
<cfif isDefined("Form.expectArrival")><cfset SESSION.consWiz.expectArrival = parseDateTime(FORM.expectArrival)></cfif>
<cfif isDefined("Form.factArrival")><cfset SESSION.consWiz.factArrival = parseDateTime(FORM.factArrival)></cfif>
<cfif isDefined("Form.statusId")><cfset SESSION.consWiz.statusId = FORM.statusId></cfif>
<cfif isDefined("Form.note")><cfset SESSION.consWiz.note = FORM.note></cfif>

<cfif isDefined("FORM.goDone")>
 <cflocation url="consignmentCommit.cfm">
</cfif>

<cfinclude template="queryFunctions.cfm">

<html>
<head><title>Работа с поставкой</title></head>
<body>

<cfoutput>
	<b>Работа с поставкой</b><br>		
</cfoutput>

<!---
<cfmenu name="menu" type="vertical" fontsize="14" bgcolor="##CCFFFF" width="150" menustyle="float:left; margin-right:100px;">
<cfmenuitem name="primaryData" href="#CGI.SCRIPT_NAME#?stepNum=1" display="Первичные данные"/>
<cfmenuitem name="cyclingShoe" href="#CGI.SCRIPT_NAME#?stepNum=2" display="Велотуфли"/>
<cfmenuitem name="cyclingShoePart" href="#CGI.SCRIPT_NAME#?stepNum=3" display="Запчасти"/>
</cfmenu>

<cfif isDefined("FORM.factArrival")><cfoutput>#tostring(parseDateTime(FORM.factArrival))#</cfoutput></cfif>

---->

<cfform name="form03" format="html" action="#CGI.SRIPT_NAME#?stepNum=#SESSION.consWiz.stepNum#" method="post" style="float:left">
	
	<cflayout type="tab" style="width:600px">
		
		<cflayoutarea title="first">
			
	
			<table align="center" bgcolor="orange">
				<tr><th colspan="2">Данные поставки</th</tr>
				<tr><td>Инвойс поставки</td><td><cfinput name="invoice" size="45" required="Yes" message="Введите инвойс поставки" value="#SESSION.consWiz.invoice#"></td></tr>
				<tr><td>Ожидаемая дата прибытия</td><td><cfinput name="expectArrival" type="datefield" required="true" validate="date" message="некорректная дата" validateAt="onSubmit,onServer" value="#SESSION.consWiz.expectArrival#"></td></tr>
				<tr><td>Фактическая дата прибытия</td><td><cfinput name="factArrival" type="datefield" required="true" validate="date" message="некорректная дата" validateAt="onSubmit,onServer" value="#SESSION.consWiz.factArrival#"></td></tr>
				<tr><td>Статус</td><td><cfselect name="statusId" query="getConsignmentStatus" selected="#SESSION.consWiz.statusId#" value="id" display="name_rus" /></td></tr>
				<tr><td>Примечание к поставке</td><td><textarea name="note" cols="40" rows="5"><cfoutput>#SESSION.consWiz.note#</cfoutput></textarea></td></tr>
				<tr><td><input type="reset" name="resetForm" value="отменить изменения формы"></td></tr>
			</table>
		</cflayoutarea>
		<cflayoutarea title="second">
			
			<cfoutput>cycling shoe</cfoutput>
			<!---
			<cfgrid format="html" name="grid01" pagesize=40 
			stripeRowColor="gray"
			bind="cfc:places.getData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
			delete="yes" selectmode="edit"
			onchange="cfc:places.editData({cfgridaction},{cfgridrow},{cfgridchanged})">
				
				<cfgridcolumn name="id" display=true header="id" select="no"/>
				<cfgridcolumn name="sold_for" display=false header="цена продажи" type="numeric"/>
				<cfgridcolumn name="sale_date" display=false header="дата продажи" type="date"/>
				<cfgridcolumn name="i_note" display=false header="примечание к товару"/>
				<cfgridcolumn name="i_pubnote" display=false header="публичное примечание к товару"/>
				<cfgridcolumn name="brand" display=false header="бренд" select="no"/>
				<cfgridcolumn name="rub" display=true header="цена в рублях" select="no"/>
				<cfgridcolumn name="usd" display=false header="цена в долларах" select="no"/>
				<cfgridcolumn name="euro_size" display=true header="размер euro" type="numeric"/>
				<!---
				<cfgridcolumn name="bont_size" display=true header="размер bont" values=#StructStringToList(APPLICATION.bontSizeRange)# valuesdisplay=#StructStringToList(APPLICATION.bontSizeRange)#/>
				---->
				<cfgridcolumn name="last_len" display=false header="длина" type="numeric"/>
				<cfgridcolumn name="width" display=true header="ширина" type="combobox" values="#lastWidthNames()#" valuesdisplay="#lastWidthNames()#"/>
				<cfgridcolumn name="color" display=true header="цвет" values=#colorNames()# valuesdisplay=#colorNames()# />
				<cfgridcolumn name="model" display=true header="модель" values=#getCyclingShoeModelName()# valuesdisplay=#getCyclingShoeModelName()#/>
				<cfgridcolumn name="weight" display=false header="вес" type="numeric" />
				<cfgridcolumn name="upper_material" display=false header="материал верха" select="no"/>
				<cfgridcolumn name="invoice" display=false header="инвойс поставки" select="no" />
				<cfgridcolumn name="fact_arrival" display=false header="фактическое прибытие поставки" select="no"/>
				<cfgridcolumn name="expect_arrival" display=false header="ожидаемое прибытие поставки" select="no"/>
				<cfgridcolumn name="cons_note" display=false header="примечание к поставке" select="no"/>
				<cfgridcolumn name="cons_status" display=false header="статус поставки" select="no"/>
				<cfgridcolumn name="i_status" display=false header="статус товара" values="#statusNames()#" valuesdisplay="#statusNames()#"/>
				<cfgridcolumn name="retailer" display=true header="Где находится" values="#retailerNames()#"/>
				<cfgridcolumn name="buyer" display=false header="покупатель" values="#buyerNames()#" valuesdisplay="#buyerNames()#"/>
			</cfgrid>
			---->
		
		</cflayoutarea>
	</cflayout>
	 <p>
	 	<INPUT type="Submit" NAME="goDone" value="завершить">
</cfform>