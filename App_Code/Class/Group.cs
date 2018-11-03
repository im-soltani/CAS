using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Department
/// </summary>
public class Group
{
    public Group()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    string _Name;
    int _Code;
    int _srt_Department;
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Name { get { return _Name; } set { _Name = value; } }
    public int Code { get { return _Code; } set { _Code = value; } }
    public int Srl_Department { get { return _srt_Department; } set { _srt_Department = value; } }
    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_Group");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Code", Code);
        com.Parameters.AddWithValue("@Srl_Department", Code);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_Group");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Code", Code);
        com.Parameters.AddWithValue("@Srl_Department", Code);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_Group", Srl);
    }
    #endregion

    #region Select
    public static DataRow GetGroup(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Group", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    public static DataTable  GetAllGroup()
    {
        
        DataTable Dr = PublicFunction.d.GetDataTable ("CAS_Group","");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }


    #endregion
    public Group(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Name = Dr["Name"].ToString();
            Code = Convert.ToInt32(Dr["Code"]);
            Srl_Department = Convert.ToInt32(Dr["Srl_Department"]);
        }
    }
    public static int GetGroupCode(String Srl)
    {
        try
        {
            
            DataRow Dr = PublicFunction.d.GetRow("CAs_Group", "Srl=" + Srl);
            if (Dr != null)
            {
                int temp = Convert.ToInt32(Dr["Code"]);
                return temp;

            }
            return 0;
        }
        catch { return 0; }
    }
    public static int GetGroupSrl(String Code)
    {
        try
        {
            
            DataRow Dr = PublicFunction.d.GetRow("CAs_Group", "Code=" + Code);
            if (Dr != null)
            {
                int temp = Convert.ToInt32(Dr["Srl"]);
                return temp;

            }
            return 0;
        }
        catch { return 0; }
    }
}