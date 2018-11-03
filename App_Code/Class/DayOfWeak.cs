using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DayOfWeak
/// </summary>
public class DayOfWeak
{
    public DayOfWeak()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    int _Srl;
    string _Name;

    #region Perperties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Name { get { return _Name; } set { _Name = value; } }
    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_DayOfWeak");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_DayOfWeak");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_DayOfWeak", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("CAS_DayOfWeak", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    public static string SearchDayOfWeakSrl(string Name)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_DayOfWeak", "Name=" + Name);
        if (Dr != null)
        {
            string temp = Dr["Srl"].ToString();
            return temp;
        }
        return null;
    }



}