using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Term
/// </summary>
public class Term
{
    public Term()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    string _Name;
    string _StartTime;
    string _EndTime;
    string _IsActive;

    #region Peroerties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Name { get { return _Name; } set { _Name = value; } }
    public string StartTime { get { return _StartTime; } set { _StartTime = value; } }
    public string EndTime { get { return _EndTime; } set { _EndTime = value; } }
    public string IsActive { get { return _IsActive; } set { _IsActive = value; } }
    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("CAS_TermInsert");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@P_Name", Name);
        com.Parameters.AddWithValue("@P_StartTime", StartTime);
        com.Parameters.AddWithValue("@P_EndTime", EndTime);
        com.Parameters.AddWithValue("@P_IsActive", IsActive);


        return PublicFunction.d.ExecQuery(com);
    }

    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("CAS_TermUpdate");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@P_Name", Name);
        com.Parameters.AddWithValue("@P_StartTime", StartTime);
        com.Parameters.AddWithValue("@P_EndTime", EndTime);
        com.Parameters.AddWithValue("@P_IsActive", IsActive);
        return PublicFunction.d.ExecQuery(com);
    }

    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("Term", Srl);
    }

    #endregion

    #region Select
    public static string  GetTermCode(int Srl)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Term", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {

            return Dr["Code"].ToString();

        }
        return "";
    }
    public static string   GetTermSrl(string  Code)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Term", "Name=N'" + Code + "'");
        if (Dr != null)
        {

            return Dr["Srl"].ToString();

        }
        return "";
    }
    public static DataTable  GetAllTerm()
    {

        
        DataTable  Dr = PublicFunction.d.GetDataTable ("CAS_Term", "");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    public static DataRow GetTerm(int Srl)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Term", " srl="+Srl.ToString());
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    public static string GetTermStartDate(int srl_term)
    {
        DataRow Dr = GetTerm (srl_term);
        if (Dr != null)
                return Dr["StartDate"].ToString();
        return "";
    }
    public static string GetTermEndDate(int srl_term)
    {
        DataRow Dr = GetTerm(srl_term);
         if (Dr != null)
                return Dr["EndDate"].ToString();
        return "";
    }

    #endregion

    #region Login
    public static DataRow GetActiveTerm()
    {
        int Active = 1;
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Term", "IsActive=" + Active);
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    #region Admin
    public static DataTable GetManageTermData()
    {
        
        return PublicFunction.d.GetDataTable("CAS_Term", "");
    }
    #endregion

   
        public static string GetTermData(string TermSrl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Term", "Srl=" + TermSrl);
        if (Dr != null)
        {
            return Dr["Name"].ToString();
        }
        return null;
    }

    

    public static string GetActiveTerm1()
    {
        int Active = 1;
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Term", "IsActive=" + Active);
        if (Dr != null)
        {
            string Nam = Dr["Name"].ToString();
            return Nam;
        }
        return null;
    }

}