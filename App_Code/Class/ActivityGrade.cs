using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ActivityGrade
/// </summary>
public class ActivityGrade
{
    public ActivityGrade()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    int _Srl_Activity;
    int _Srl_Student;
    double _Grade;

    #region Perperties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public int Srl_Activity { get { return _Srl_Activity; } set { _Srl_Activity = value; } }
    public int Srl_Student { get { return _Srl_Student; } set { _Srl_Student = value; } }
    public double Grade { get { return _Grade; } set { _Grade = value; } }
    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("CAS_ActivityGrade_Proc");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Activity", Srl_Activity);
        com.Parameters.AddWithValue("@Srl_Student", Srl_Student);
        com.Parameters.AddWithValue("@Grade", Grade);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_ActivityGrade");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Activity", Srl_Activity);
        com.Parameters.AddWithValue("@Srl_Student", Srl_Student);
        com.Parameters.AddWithValue("@Grade", Grade);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_ActivityGrade", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_ActivityGrade", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    #region Student
    public static DataRow GetActivityGradeData(int ActivityGradeSrl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("Vw_GetStudentActivityData", "Srl=" + ActivityGradeSrl.ToString());
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }
    #endregion
}