using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TempErae
/// </summary>
public class TempErae
{
    public TempErae()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    int _Srl_Course;
    int _Srl_Master;
    int _Srl_Term;
    int _Group;
    bool _IsActive;

    #region properties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public int Srl_Course { get { return _Srl_Course; } set { _Srl_Course = value; } }
    public int Srl_Master { get { return _Srl_Master; } set { _Srl_Master = value; } }
    public int Srl_Term { get { return _Srl_Term; } set { _Srl_Term = value; } }
    public int Group { get { return _Group; } set { _Group = value; } }
    public bool IsActive { get { return _IsActive; } set { _IsActive = value; } }

    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_TempErae");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Course", Srl_Course);
        com.Parameters.AddWithValue("@Srl_Master", Srl_Master);
        com.Parameters.AddWithValue("@Srl_Term", Srl_Term);
        com.Parameters.AddWithValue("@Code", Group);
        com.Parameters.AddWithValue("@IsActive", IsActive);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_TempErae");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Course", Srl_Course);
        com.Parameters.AddWithValue("@Srl_Master", Srl_Master);
        com.Parameters.AddWithValue("@Srl_Term", Srl_Term);
        com.Parameters.AddWithValue("@Code", Group);
        com.Parameters.AddWithValue("@IsActive", IsActive);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_TempErae", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_TempErae", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {

            return Dr;

        }
        return null;
    }
    #endregion

    public TempErae(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Srl_Term = Convert.ToInt32(Dr["Srl_Term"]);
            Srl_Master = Convert.ToInt32(Dr["Srl_Master"]);
            Srl_Course = Convert.ToInt32(Dr["Srl_Course"]);
            Group = Convert.ToInt32(Dr["Code"]);
            IsActive = Convert.ToBoolean(Dr["IsActive"]);
        }
    }
}