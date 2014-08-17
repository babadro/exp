//======================================
//Listing 74.8 ASP.NET Names Web Service 
//======================================

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
	/// This class connects to an Access Database and returns a 
	/// DataSet through a Web Method.
	/// </summary>

	// This class connects to an Access Database and returns a 
	// DataSet through a Web Method.

	public class NameService : System.Web.Services.WebService
	{
		//Declare the Dataset object
		private DataSet namesDataSet; 
        //NameService class constructor
		public NameService()
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
		// The GetNames() example service returns a DataSet of names
		[WebMethod]
		public DataSet GetNames(string sFilter1, string sFilter2)
		{
			//Assign a SQL statement with wildcard filter to string variables
			string sFilterWild1 = sFilter1 + "%'";
			string sFilterWild2 = sFilter2 + "%'";
			string sqlStr = "SELECT * FROM [names] "
				+ "WHERE name LIKE '";
			string sqlStr1 = sqlStr + sFilterWild1;
			string sqlStr2 = sqlStr + sFilterWild2;
			//Create an OleDbConnection object
			OleDbConnection namesConn = new OleDbConnection(@"Provider="
				+ @"Microsoft.Jet.OLEDB.4.0; Data Source=C:\Inetpub\wwwroot\"
				+ @"WebServices1\Names.mdb;");
			//Create a DataSet object
			namesDataSet = new DataSet("TheDataSet");
			try
			{
				namesConn.Open();
				//Using the OleDbDataAdapter execute the query
				OleDbDataAdapter namesAdapter = new OleDbDataAdapter();
				//Define the command
				namesAdapter.SelectCommand = new OleDbCommand(sqlStr1,namesConn);
				//Add the Table 'names'to the dataset
				namesAdapter.Fill(namesDataSet,"Result1");
				//Add second command result
				namesAdapter.SelectCommand = new OleDbCommand(sqlStr2,namesConn);
				namesAdapter.Fill(namesDataSet,"Result2");
				namesAdapter.Dispose();
			}
			catch(Exception e)
			{
				Debug.WriteLine("Error in connecting! "+e.ToString(), "Error");
			}
			finally
			{
				//Close the OleDbConnection
				namesConn.Close() ;
				namesConn.Dispose();
			}
			return namesDataSet;
		}
	}
}
