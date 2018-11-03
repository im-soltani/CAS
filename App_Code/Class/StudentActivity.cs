using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for StudentActivity
/// </summary>
public class StudentActivity
{
    public StudentActivity()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    int _Srl;
    int _Srl_Activity;
    int _Srl_Student;
    string _RegDate;
    string _RegTime;
    string _DocumentFile;
    string _Description;
    


    #region properties

    public int srl { get { return _Srl; } set { _Srl = value; } }
    public int Srl_Activity { get { return _Srl_Activity; } set { _Srl_Activity = value; } }
    public int Srl_Student { get { return _Srl_Student; } set { _Srl_Student = value; } }
    public string RegDate { get { return _RegDate; } set { _RegDate = value; } }
    public string RegTime { get { return _RegTime; } set { _RegTime = value; } }
    public string DocumentFile { get { return _DocumentFile; } set { _DocumentFile = value; } }
    public string Description { get { return _Description; } set { _Description = value; } }
    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_StudentActivity");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Activity", Srl_Activity);
        com.Parameters.AddWithValue("@Srl_Student", Srl_Student);
        com.Parameters.AddWithValue("@RegDate ", RegDate);
        com.Parameters.AddWithValue("@RegTime", RegTime);
        com.Parameters.AddWithValue("@DocumentFile", DocumentFile);
        com.Parameters.AddWithValue("@Description", Description);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_StudentActivity");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl", srl);
        com.Parameters.AddWithValue("@Srl_Activity", Srl_Activity);
        com.Parameters.AddWithValue("@Srl_Student", Srl_Student);
        com.Parameters.AddWithValue("@RegDate ", RegDate);
        com.Parameters.AddWithValue("@RegTime", RegTime);
        com.Parameters.AddWithValue("@DocumentFile", DocumentFile);
        com.Parameters.AddWithValue("@Description", Description);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_StudentActivity", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_StudentActivity", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    #region Student 
    public static DataRow GetStudentActivityData(int ActivitySrl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_StudentActivity", "Srl_Activity=" + ActivitySrl.ToString() );
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion
}