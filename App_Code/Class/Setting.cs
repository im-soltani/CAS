using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Setting
/// </summary>
public class Setting
{
    public Setting()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static bool InsertSettingData(string name,DateTime _date_start, DateTime _date_end, DateTime _date_start_class, DateTime _date_end_class)
    {
       

        
        SqlCommand com = new SqlCommand("CAS_Term");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", name);
        com.Parameters.AddWithValue("@StartDate", _date_start);
        com.Parameters.AddWithValue("@EndDate", _date_end);

        SqlCommand com1 = new SqlCommand("CAS_Section");
        com1.CommandType = CommandType.StoredProcedure;
        com1.Parameters.AddWithValue("@Star", _date_start);
        com1.Parameters.AddWithValue("@EndTime", _date_end);

        return true;
    }
}