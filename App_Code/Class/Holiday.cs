using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Holiday
/// </summary>
public class Holiday
{
    public Holiday()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    int _Srl;
    string _Tarikh;
    string _Description;

    #region Perperties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Tarikh { get { return _Tarikh; } set { _Tarikh = value; } }
    public string Description { get { return _Description; } set { _Description = value; } }
    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_Holiday");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Tarikh", Tarikh);
        com.Parameters.AddWithValue("@Description", Description);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_Holiday");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Tarikh", Tarikh);
        com.Parameters.AddWithValue("@Description", Description);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("Holiday", Srl);

    }
    #endregion

    #region Select
    public static DataRow GetHoliday(int Srl)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Holiday", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {

            return Dr;

        }
        return null;
    }
     public static DataTable  GetAllHoliday()
    {


        DataTable Dr = PublicFunction.d.GetDataTable("CAS_Holiday","");
        if (Dr != null)
        {

            return Dr;

        }
        return null;
    }
    public static Boolean IsHoliday(string tarikh)
    {
        if (VB_Component.DateFuntion.GetDeyOfWeek(tarikh) == "جمعه")
            return true;

        DataRow Dr = PublicFunction.d.GetRow("CAS_Holiday", "tarikh=N"+tarikh );
        if (Dr != null)
            return true;
        return false;
    }
    #endregion
}