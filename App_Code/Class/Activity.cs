using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Activity
/// </summary>
public class Activity
{
    public Activity()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    string _Title;
    string _Description;
    int _Srl_Erae;
    string _RegDate;
    string _DeadlineDate;
    string _DeadlineTime;
    float _FinalPercent;
    float _Grade;
    bool _IsActive;
    string _DocumentFile;

    #region Perperties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Title { get { return _Title; } set { _Title = value; } }
    public string Description { get { return _Description; } set { _Description = value; } }
    public int Srl_Erae { get { return _Srl_Erae; } set { _Srl_Erae = value; } }
    public string RegDate { get { return _RegDate; } set { _RegDate = value; } }
    public string DeadlineDate { get { return _DeadlineDate; } set { _DeadlineDate = value; } }
    public string DeadlineTime { get { return _DeadlineTime; } set { _DeadlineTime = value; } }
    public float FinalPercent { get { return _FinalPercent; } set { _FinalPercent = value; } }
    public float Grade { get { return _Grade; } set { _Grade = value; } }
    public bool IsActive { get { return _IsActive; } set { _IsActive = value; } }
    public string DocumentFile { get { return _DocumentFile; } set { _DocumentFile = value; } }

    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_Activity");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Title", Title);
        com.Parameters.AddWithValue("@Description", Description);
        com.Parameters.AddWithValue("@Srl_Erae", Srl_Erae);
        com.Parameters.AddWithValue("@RegDate", RegDate);
        com.Parameters.AddWithValue("@DeadlineDate", DeadlineDate);
        com.Parameters.AddWithValue("@DeadlineTime", DeadlineTime);
        com.Parameters.AddWithValue("@FinalPercent", FinalPercent);
        com.Parameters.AddWithValue("@Grade", Grade);
        com.Parameters.AddWithValue("@IsActive", IsActive);
        com.Parameters.AddWithValue("@DocumentFile", DocumentFile);

        return PublicFunction.d.ExecQuery(com);
    }

    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_Activity");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Title", Title);
        com.Parameters.AddWithValue("@Description", Description);
        com.Parameters.AddWithValue("@Srl_Erae", Srl_Erae);
        com.Parameters.AddWithValue("@RegDate", RegDate);
        com.Parameters.AddWithValue("@DeadlineDate", DeadlineDate);
        com.Parameters.AddWithValue("@DeadlineTime", DeadlineTime);
        com.Parameters.AddWithValue("@FinalPercent", FinalPercent);
        com.Parameters.AddWithValue("@Grade", Grade);
        com.Parameters.AddWithValue("@IsActive", IsActive);
        com.Parameters.AddWithValue("@DocumentFile", DocumentFile);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_Activity", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Activity", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    #region Admin
    public static DataTable GetManageHomeWorkData(string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetManageHomeWorkData", "Srl_Term=" + Term);
    }
    #endregion

    #region Student
    public static DataTable GetStudentHomWorkData(string Srl,int EraeSrl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetStudentActivityData", "Srl_Student=" + Srl + "and Srl_Erae=" + EraeSrl.ToString() + " and Srl_Term=" + Term);
    }

    public static DataTable GetStudentAllHomWorkData(string Srl,string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetStudentActivityData", "Srl_Student=" + Srl+ "and Srl_Term=" + Term);
    }

    #endregion

    #region Teacher

    public static DataTable GetTeacherHomeWorkData(int EraeSrl)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherHomeWorkData", "Srl_Erae=" + EraeSrl.ToString());
    }

    public static DataTable GetTeacherAllHomWorkData(string Srl , string Term )
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherHomeWorkData", "Srl_Master=" + Srl + "and Srl_Term=" + Term);
    }

    public static DataTable GetNewHomeWorkData(int Srl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherNewHomeWorkData", "Srl_Erae=" + Srl.ToString() + "and Srl_Term=" + Term);
    }
    public static DataTable GetTeacherEditeHomeWorkData(int Srl)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherNewHomeWork", "Srl=" + Srl.ToString());
    }
    //public static DataTable UpdateGradeHomeWorkData(int Srl)
    // {
    //     
    //     return d.Update("Vw_GetTeacherNewHomeWork", "Srl=" + Srl.ToString());
    // }

    public static DataRow GetSrlActivityData(string Title)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Activity", "Title=" + Title );
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }

   
    #endregion

    #region SumActivity
    public static float GetSumAllActivity(string Srl,string EraeSrl)
    {
        float Sum = 0;
        float Temp = 0;
        
        DataTable AllGrade = PublicFunction.d.GetDataTable("Vw_GetStudentActivityData", "Srl_Student=" + Srl + "and Srl_Erae=" + EraeSrl);
        int count = AllGrade.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            Temp = (float)Convert.ToDouble( AllGrade.Rows[i]["GradeActivity"]);
            Sum = Sum + Temp;
        }      
        return Sum;
    }

    public static float GetSumActivity(string Srl ,string EraeSrl)
    {
        float Sum = 0;
        float Temp = 0;
        
        DataTable AllGrade = PublicFunction.d.GetDataTable("Vw_GetStudentActivityData", "Srl_Student=" + Srl + "and Srl_Erae=" + EraeSrl);
        int count = AllGrade.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            Temp = (float)Convert.ToDouble(AllGrade.Rows[i]["Grade"]);
            Sum = Sum + Temp;
        }
        return Sum;
    }
    #endregion

    #region TeacherSumFinalPercent
    public static float GetSumFinalPercent(string EraeSrl)
    {
        float Sum = 0;
        float Temp = 0;
        
        DataTable AllGrade = PublicFunction.d.GetDataTable("Vw_GetTeacherHomeWorkData", "Srl_Erae=" + EraeSrl);
        int count = AllGrade.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            Temp = (float)Convert.ToDouble(AllGrade.Rows[i]["FinalPercent"]);
            Sum = Sum + Temp;
        }
        return Sum;
    }
    #endregion


}
