<cfif isDefined("form.submit")>
    <cfset messageObject = structNew()>
    <cfset messageObject.message = form.message>
    <cfset messageObject.type = form.msgType>
            
    <cfset flexMesssage = StructNew()>
    <cfset flexMesssage.body = messageObject>
    <cfset flexMesssage.Destination = "ColdFusionGateway">
    <cfset ret = SendGatewayMessage("ows32_example4", flexMesssage)>
    <p>Message has been sent!</p>
</cfif>

<cfform>
    <b>Type:</b><br/>
    <cfinput type="radio" name="msgType" value="Information" checked="true"> Information<br/>
    <cfinput type="radio" name="msgType" value="Warning"> Warning <br/>
    <cfinput type="radio" name="msgType" value="Error"> Error <br/>
    <b>Message</b><br/>
    <cftextarea id="message" name="message" rows="6" cols="50"/><br/>
    <cfinput type="submit" name="submit" value="Send Message">
</cfform>