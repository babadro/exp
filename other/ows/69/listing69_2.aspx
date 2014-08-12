<%--
   Name:        listing69_2.aspx
   Author:      Josh Adams
   Description: Makes a call to the ColdFusion 9 Exposed Services Layer
                Document Service
   Created:     May 26, 2010
--%>

<%@ Page Language="C#" %>
<script runat="server">
   <%--Create a variable to hold the URL for the generated PDF file.--%>
   string pdfURL = "";
   
   <%--
      Use the Page_Load method to make the Web Service call. This
      special method is automatically called when the page loads.
   --%>
   private void Page_Load(object sender, System.EventArgs e)
   {
      <%--Create an instance of the DocumentService proxy class.--%>
      DocumentService docSvc = new DocumentService();
      
      <%--Create an empty array to pass for documentsection.--%>
      Documentsection[] dsa = { };
      
      <%--Create an empty array to pass for documentitem.--%>
      Documentitem[] dia = { };
      
      <%--Create an instance of the Random class.--%>
      Random randomObj = new Random();
      
      <%--Dynamically generate content for the PDF.--%>
      string pdfContent = "The current date and time is " + DateTime.Now +
         " and my current favorite number is " + randomObj.Next() + ".";
      
      <%--
         Call the generate operation of the DocumentService Web Service
         and assign the value returned to pdfURL.
      --%>
      pdfURL = docSvc.generate("remoteuser", "remoteuserpassword", "pdf",
         pdfContent, "", "", "", "", "", "", "", "", "", "", "", "", "",
         "", "", "", "", "", "", "", "", "", "", "", "", "", dsa, dia);
   }
</script>

<%--Output the pdfURL as a link--%>
<a href="<%= pdfURL %>">My Custom PDF</a>