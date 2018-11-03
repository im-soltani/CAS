using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for APChecking
/// </summary>
public class APChecking
{
    public APChecking()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    int _Srl_Session;
    int _Srl_Student;
    int _Delay;

    #region properties

    public int srl { get { return _Srl; } set { _Srl = value; } }
    public int Srl_Session { get { return _Srl_Session; } set { _Srl_Session = value; } }
    public int Srl_Student { get { return _Srl_Student; } set { _Srl_Student = value; } }
    public int Delay { get { return _Delay; } set { _Delay = value; } }

    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("CAS_APChecking_proc");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Section", Srl_Session);
        com.Parameters.AddWithValue("@Srl_Student", Srl_Student);
        com.Parameters.AddWithValue("@Delay", Delay);

        return PublicFunction.d.ExecQuery(com);
    }

    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("CAS_APCheckingUpdate");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Session", Srl_Session);
        com.Parameters.AddWithValue("@Srl_Student", Srl_Student);
        com.Parameters.AddWithValue("@Delay", Delay);
        return PublicFunction.d.ExecQuery(com);
    }

    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_APChecking", Srl);
    }

    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("APChecking", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    #region Admin
    public static DataTable GetManageAPCheckingData(String Erae)
    {
        
        return PublicFunction.d.GetDataTable("CAS_Session", "Srl_Erae=" + Erae);
    }
    #endregion

    #region Student
    public static DataTable GetStudentAPCheckingData(int Srl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetStudentAPCheckingData", "Srl_Erae=" + Srl.ToString() + " and Srl_term=" + Term);
    }
    public static DataTable GetStudentAllAPCheckingData(string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetStudentAPCheckingData", "Srl_term=" + Term);
    }
    #endregion

    #region Teacher

    public static DataTable GetTeacherAPCheckingData(int Srl)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherAPCheckingData", "Srl_Erae=" + Srl.ToString());
    }
    public static DataTable GetTeacherAllAPCheckingData(string Srl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherAPCheckingData", "Srl_Master=" + Srl + "and Srl_term=" + Term);
    }

    public static DataTable GetTeacherNewAPCheckingData(int Srl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherNewAPCheckingData", "Srl_Erae=" + Srl.ToString() + " and Srl_term=" + Term);
    }
    
    #endregion

    #region StudentSumAPChecking

    public static int GetSumAPChecking(string Srl, string EraeSrl)
    {
        int Sum = 0;
        
        DataTable AllAPChecking = PublicFunction.d.GetDataTable("Vw_GetStudentAPCheckingData", "Srl_Student=" + Srl + "and Srl_Erae=" + EraeSrl );
        int _count = AllAPChecking.Rows.Count;
        System.Diagnostics.Debug.WriteLine(AllAPChecking.Columns.Count);
        for (int i = 0; i < _count; i++)
        {
            if (Convert.ToInt32(AllAPChecking.Rows[i]["Delay"]) == -1)
            {
                Sum++;
            }
        }
        return Sum;
    }

    #endregion

    #region TeacherSumMeeting
    public static int GetSumMeetingHeld( string EraeSrl)
    {
        int Sum = 0;
        
        DataTable AllMeeting = PublicFunction.d.GetDataTable("Vw_GetTeacherAPCheckingData", "Srl_Erae=" + EraeSrl);
        int _count = AllMeeting.Rows.Count;
        System.Diagnostics.Debug.WriteLine(AllMeeting.Columns.Count);
        for (int i = 0; i < _count; i++)
        {
            if (Convert.ToInt32(AllMeeting.Rows[i]["IsStart"]) == 1)
            {
                Sum++;
            }
        }
        return Sum;
    }
    #endregion

}