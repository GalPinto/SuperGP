using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

/// <summary>
/// Summary description for sql_db
/// </summary>
public class sql_db
{
	public sql_db()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static DataSet chkData(string sqlstr)
    {
        string path = HttpContext.Current.Server.MapPath("~/App_Data/");
        string fileName = "DataBaseCostumers.mdb";
        path += fileName;
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path;
        OleDbConnection conn = new OleDbConnection(connString);
        OleDbDataAdapter da = new OleDbDataAdapter(sqlstr,conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    //update delete insert
    public static void udi(string sqlstr)
    {
        string path = HttpContext.Current.Server.MapPath("~/App_Data/");
        string fileName = "DatabaseCostumers.mdb";
        path += fileName;
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path;
        OleDbConnection conn = new OleDbConnection(connString);
        OleDbCommand build = new OleDbCommand(sqlstr, conn);
        conn.Open();
        build.ExecuteNonQuery();
        conn.Close();
    }
}
