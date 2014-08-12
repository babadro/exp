//================================================
// Listing 66.6  Hello World Web Service 
//================================================

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace WebServices1
{
	/// <summary>
	/// This class returns a string through a Web Method.
	/// </summary>


	// This class returns a string through a Web Method.

	public class WebService1 : System.Web.Services.WebService
	{		
		//WebService1 class constructor
		public WebService1()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion

		// Hello World example web service
		[WebMethod]
		public string HelloWorld()
		{
			return "Hello World";
		}
	}
}
