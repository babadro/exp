//===============================================================================
//Listing 66.4 Create a .NET Data Table 
//===============================================================================

using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace CFNETDemoLib
{
    public class DtDemo
    {
        public DataTable GetDataTable()
        {
            //===============================================================================
		    // Create a table specify some columns
		    //===============================================================================
		    DataTable dTable = new DataTable("Authors");
		    dTable.Columns.Add("firstName", System.Type.GetType("System.String"));
		    dTable.Columns.Add("lastName", System.Type.GetType("System.String"));
            dTable.Columns.Add("age", System.Type.GetType("System.Int32"));

            //===============================================================================
            // Create and add DataRow items to the table
            //===============================================================================
            DataRow dRow1, dRow2, dRow3, dRow4;

            //Set dRow1 data
            dRow1 = dTable.NewRow();
            dRow1["firstName"] = "Ben";
            dRow1["lastName"] = "Forta";
            dRow1["age"] = 21;
            dTable.Rows.Add(dRow1);
            
            //Set dRow2 data
            dRow2 = dTable.NewRow();
            dRow2["firstName"] = "Ray";
            dRow2["lastName"] = "Camden";
            dRow2["age"] = 21;
            dTable.Rows.Add(dRow2);
            
            //Set dRow3 data
            dRow3 = dTable.NewRow();
            dRow3["firstName"] = "Robi";
            dRow3["lastName"] = "Sen";
            dRow3["age"] = 21;
            dTable.Rows.Add(dRow3);
            
            //Set dRow4 data
            dRow4 = dTable.NewRow();
            dRow4["firstName"] = "Jeff";
            dRow4["lastName"] = "Bouley";
            dRow4["age"] = 21;
            dTable.Rows.Add(dRow4);

            //Return the DataTable
            return dTable;
        }
    }
}
