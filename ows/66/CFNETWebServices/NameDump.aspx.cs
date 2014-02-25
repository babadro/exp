//================================================
//Listing 74.13 CFQUERY Output from CF Web Service 
//================================================

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace WebServices1
{
	/// <summary>
	/// This class consumes a QueryBean form a CF
	/// Web Service and converts it to a DataTable 
	/// for output.
	/// </summary>

	
	// This class consumes a QueryBean for a CF Web Service and 
	// converts it to a DataTable for output.
	
	public partial class NameDump : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//Create the string filter to pass to the web service
			string sFilter = "je";
			//Reference the ColdFusion web service
			GetNamesCFC.NameServiceService cfWs = new GetNamesCFC.NameServiceService();			
			//Reference the QueryBean that ColdFusion returns from the web service
			GetNamesCFC.QueryBean qBean = cfWs.GetNames(sFilter);
			DataTable dTable = MakeTable(qBean.columnList);
			object oData = new object();
			DataRow row = null;       
			int iCount = 0;    
            
			//Add QueryBean data to the DataTable
			for (int i=0;i<=qBean.data.Length-1;i++)
			{
				oData = qBean.data[i];
				row = dTable.NewRow();
				foreach(object oLoopData in ((Array)(oData)))
				{
					row[iCount] = oLoopData;
					iCount = iCount + 1;
				}
				iCount = 0;
				dTable.Rows.Add(row);
			}
			DataGrid1.DataSource = dTable;
			DataGrid1.DataBind();
		}

		private DataTable MakeTable(string[] sColumns)
		{
			//Make a table with all of the names from the array sColumns column
			//list contained in the QueryBean
			DataTable dTable = new DataTable("dTable");
			DataColumn dColumn;

			foreach(string columnName in sColumns)
			{
				dColumn = new DataColumn(columnName, Type.GetType("System.String"));
				dTable.Columns.Add(dColumn);
			}
			return dTable;
		}
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
	}
}