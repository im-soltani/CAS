using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Teacher
/// </summary>
public class Teacher
{
    public Teacher()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    string _Name;
    string _Family;
    int _Srl_Group;
    int _Code;
    string _Email;
    string _TelegramID;
    string _Mobile;
    string _Picture;
    bool _IsActive;

    #region properties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Name { get { return _Name; } set { _Name = value; } }
    public string Family { get { return _Family; } set { _Family = value; } }
    public int Code { get { return _Code; } set { _Code = value; } }
    public string Email { get { return _Email; } set { _Email = value; } }
    public string TelegramID { get { return _TelegramID; } set { _TelegramID = value; } }
    public int Srl_Group { get { return _Srl_Group; } set { _Srl_Group = value; } }
    public string Mobile { get { return _Mobile; } set { _Mobile = value; } }
    public string Picture { get { return _Picture; } set { _Picture = value; } }
    public bool IsActive { get { return _IsActive; } set { _IsActive = value; } }

    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_Master");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Family", Family);
        com.Parameters.AddWithValue("@Code", Code);
        com.Parameters.AddWithValue("@Email", Email);
        com.Parameters.AddWithValue("@Mobile", Mobile );
        com.Parameters.AddWithValue("@TelegramID", TelegramID);
        com.Parameters.AddWithValue("@Srl_Group", Srl_Group);
        com.Parameters.AddWithValue("@Picture", Picture);
        com.Parameters.AddWithValue("@IsActive", IsActive);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_Master");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Family", Family);
        com.Parameters.AddWithValue("@Code", Code);
        com.Parameters.AddWithValue("@Email", Email);
        com.Parameters.AddWithValue("@TelegramID", TelegramID);
        com.Parameters.AddWithValue("@Srl_Group", Srl_Group);
        com.Parameters.AddWithValue("@Picture", Picture);
        com.Parameters.AddWithValue("@IsActive", IsActive);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_Master", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Master", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {

            return Dr;

        }
        return null;
    }
    #endregion

    #region Login
    public static DataRow GetTeacherSrl(String Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Master", "Srl=" + Srl);
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }
    #endregion

    #region Admin
    public static DataTable GetManageTeacherData(string Term)
    {
        
        return PublicFunction.d.GetDataTable("CAs_Master", " ");
    }
    #endregion

    #region Master & profile
    public static DataRow GetTeacherData(string Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Master", "Srl=" + Srl);
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }

         public static DataRow GetGroupData(string Srl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Group", "Srl=" + Srl);
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }
    #endregion

    #region GetTeacherClassRoomPlan
    public static DataRow GetTeacherClassRoomPlan(string TeacherSrl,string Term, int DayOfWeakSrl,string StartTime,string EndTime)
    {
        
        //char Start = Convert.ToChar(StartTime);
        //char End = Convert.ToChar(EndTime);
        DataRow Dr = PublicFunction.d.GetRow("Vw_GetTeacherClassRoomPlanData", "Srl_Master=" + TeacherSrl + "and Srl_Term=" + Term + "and Srl_DayOfWeak=" + DayOfWeakSrl + "and StartTiem=" + StartTime + "and EndTime=" + EndTime);
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }
    public static DataRow GetTeacherDayOfWeak(int DayOfWeakSrl)
    {
        
    DataRow Dr = PublicFunction.d.GetRow("CAS_DayOfWeek", "Srl=" + DayOfWeakSrl.ToString());
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }


    #endregion

    public Teacher(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Name = Dr["Name"].ToString();
            Family = Dr["Family"].ToString();
            Srl_Group = Convert.ToInt32(Dr["Srl_Group"]);
            Code = Convert.ToInt32(Dr["Code"]);
            Email = Dr["Email"].ToString();
            TelegramID = Dr["TelegramID"].ToString();
            Mobile = Dr["Mobile"].ToString();
            IsActive = Convert.ToBoolean(Dr["IsActive"]);
        }
    }
    public static DataTable GetTeacherData()
    {
        
        return PublicFunction.d.GetDataTable("CAS_Master", "");
    }
    public static DataRow GetMasterCode(String code)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Master", "Code=" + code);
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }
    public static bool SearchmastrSrl(int Code)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Master", "code=" + Code.ToString());
        if (Dr != null)
        {
            return true;

        }
        return false;
    }

}