using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EraeTime
/// </summary>
public class EraeTime
{
    public EraeTime()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    int _Srl_Erae;
    int _Srl_DayOfWeak;
    string _StartTime;
    string _EndTime;
    int _Srl_SessionType;

    #region properties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public int Srl_Erae { get { return _Srl_Erae; } set { _Srl_Erae = value; } }
    public int Srl_DayOfWeak { get { return _Srl_DayOfWeak; } set { _Srl_DayOfWeak = value; } }
    public string EndTime { get { return _EndTime; } set { _EndTime = value; } }
    public string StartTime { get { return _StartTime; } set { _StartTime = value; } }
    public int Srl_SessionType { get { return _Srl_SessionType; } set { _Srl_SessionType = value; } }


    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_EraeTime");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Erae", Srl_Erae);
        com.Parameters.AddWithValue("@Srl_DayOfWeak", Srl_DayOfWeak);
        com.Parameters.AddWithValue("@StartTime", StartTime);
        com.Parameters.AddWithValue("@EndTime", EndTime);
        com.Parameters.AddWithValue("@Srl_SessionType", Srl_SessionType);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_EraeTime");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Erae", Srl_Erae);
        com.Parameters.AddWithValue("@Srl_DayOfWeak", Srl_DayOfWeak);
        com.Parameters.AddWithValue("@StartTime", StartTime);
        com.Parameters.AddWithValue("@EndTime", EndTime);
        com.Parameters.AddWithValue("@Srl_SessionType", Srl_SessionType);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_EraeTime", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_EraeTime", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {

            return Dr;

        }
        return null;
    }
    #endregion

    public EraeTime(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Srl_Erae = Convert.ToInt32(Dr["Srl_Erae"]);
            Srl_DayOfWeak = Convert.ToInt32(Dr["Srl_DayOfWeak"]);
            StartTime = Dr["StartTime"].ToString();
            EndTime = Dr["EndTime"].ToString();
            Srl_SessionType = Convert.ToInt32(Dr["Srl_SessionType"]);
        }
    }

    public static string SearchSessionTypeSrl(string Name)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_SessionType", "Name=" + Name);
        if (Dr != null)
        {
            string temp = Dr["Srl"].ToString();
            return temp;
        }
        return null;
    }
}