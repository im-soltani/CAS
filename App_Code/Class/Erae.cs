using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Erae
/// </summary>
public class Erae
{
    public Erae()
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
        
        SqlCommand com = new SqlCommand("InsertCAS_Erae");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Course", Srl_Course);
        com.Parameters.AddWithValue("@Srl_Master", Srl_Master);
        com.Parameters.AddWithValue("@Srl_Term", Srl_Term);
        com.Parameters.AddWithValue("@Code", Group);
        com.Parameters.AddWithValue("@IsActive", IsActive);

        return PublicFunction.d.ExecQuery(com);
    }
    public  bool IsExistErae()
    {
        DataAccess d = new global::DataAccess();
        DataRow  dr = PublicFunction.d.GetRow ("CAS_Erae", "Srl_Course =" + Srl_Course.ToString() + " and  Srl_Master=" + Srl_Master.ToString() + " and  Srl_term = " + Srl_Term.ToString() + " and  code=" + Group.ToString());
        if (dr!=null)
            return true;
        return false;
    }
    public DataTable GetNewErae(int Srl_Term,int Srl_Department)
    {
        DataAccess d = new global::DataAccess();

      
        return null;
    }
    public bool TempInsert()
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
    public int InsertWithLastID()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_EraeWithLastID");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Course", Srl_Course);
        com.Parameters.AddWithValue("@Srl_Master", Srl_Master);
        com.Parameters.AddWithValue("@Srl_Term", Srl_Term);
        com.Parameters.AddWithValue("@Code", Group);
        com.Parameters.AddWithValue("@IsActive", IsActive);
        SqlParameter sqlp = new SqlParameter("@scope", SqlDbType.Int, 4);
        sqlp.Direction = ParameterDirection.Output;
        com.Parameters.Add(sqlp);
        if (PublicFunction.d.ExecQuery(com))
            return int.Parse(com.Parameters["@scope"].Value.ToString());
        return 0; 

    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_Erae");
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
    public bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_Erae", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Erae", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {

            return Dr;

        }
        return null;
    }
    public static DataTable  GetEraeOfTerm(int Srl_Term)
    {

        DataTable Dr = PublicFunction.d.GetDataTable ("CAS_Erae", "Srl_Term=" + Srl_Term.ToString() );
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    public Erae(DataRow Dr)
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

    public static bool SearchEraeCode(string Srl_Master, string Srl_Course)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Erae", "Srl_Master=" + Srl_Master);
        if (Dr != null)
        {
            string temp = Dr["Srl_Course"].ToString();
            if (temp == Srl_Course)
                return true;
        }
        return false;
    }

    public static bool CompErae()
    {
        
        Erae E = new Erae();
        DataTable Dr = PublicFunction.d.GetDataTable("select * from CAS_Erae Except select * from CAS_TempErae");
        int count = Dr.Rows.Count;
        for (int i = 0; i != count; i++)
        {

            DataRow Temp = Dr.Rows[i];
            string code = Temp["Code"].ToString();
            string srlcource = Convert.ToString(Temp["Srl_Course"]);
            string srlmaster = Temp["Srl_Master"].ToString();
            string srlTerm = Temp["Srl_Term"].ToString();
            PublicFunction.d.Delete("CAS_Erae", "Code=" + code + " and Srl_Course=" + srlcource + " and Srl_Master=" + srlmaster + " and Srl_Term=" + srlTerm);

        }



        return true;

    }

    public static string SearchEraeSrl(string Group, string Master, int course)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Erae", "Srl_Group=" + Group + "and Srl_Master=" + Master + "and Srl_Course=" + course.ToString());
        if (Dr != null)
        {
            string temp = Dr["Srl"].ToString();

            return temp;
        }


        return null;
    }
}