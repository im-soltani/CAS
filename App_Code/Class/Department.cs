using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Department
/// </summary>
public class Department
{
    public Department()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    string _Name;
    int _Code;
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Name { get { return _Name; } set { _Name = value; } }
    public int Code { get { return _Code; } set { _Code = value; } }
    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_DEpartment");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Code", Code);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_DEpartment");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Code", Code);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_DEpartment", Srl);
    }
    #endregion

    #region Select
    public static DataRow GetDepartment(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_DEpartment", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    public static DataTable  GetAllDepartment()
    {
        
        DataTable Dr = PublicFunction.d.GetDataTable ("CAS_DEpartment","");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }


    #endregion
    public Department(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Name = Dr["Name"].ToString();
            Code = Convert.ToInt32(Dr["Code"]);
        }
    }
    public static int GetDepartmentCode(String Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_DEpartment", "Srl=" + Srl);
        if (Dr != null)
        {
            int temp = Convert.ToInt32(Dr["Code"]);
            return temp;

        }
        return 0;
    }

           public static int GetDepartmentSrl(String Code)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_DEpartment", "Code=" + Code);
        if (Dr != null)
        {
            int temp = Convert.ToInt32(Dr["Srl"]);
            return temp;

        }
        return 0;
    }
}