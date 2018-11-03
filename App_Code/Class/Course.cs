using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Course
/// </summary>
public class Course
{
    public Course()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Course(int Srl)
    {
        
        DataRow dr = PublicFunction.d.GetRow("CAS_Course", srl);
        if (dr != null)
        {
            Srl = srl;
            Name = dr["Name"].ToString();
            Code = dr["code"].ToString();
        }

    }


    int _Srl;

    string _Name;
    string _Code;
    int _Srl_Group;

    int _Srl_Department;
    int _Srl_Type;
    bool _IsActive;


    #region perperties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string Name { get { return _Name; } set { _Name = value; } }
    public string Code { get { return _Code; } set { _Code = value; } }
    public int Srl_Group { get { return _Srl_Group; } set { _Srl_Group = value; } }
    public int Srl_Department { get { return _Srl_Department; } set { _Srl_Department = value; } }
    public bool IsActive { get { return _IsActive; } set { _IsActive = value; } }

    public int Srl_Type { get { return _Srl_Type; } set { _Srl_Type = value; } }
    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_Course");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Name", Name);
        com.Parameters.AddWithValue("@Code", Code);
        com.Parameters.AddWithValue("@Srl_Group", Srl_Group);
        com.Parameters.AddWithValue("@Srl_Type", Srl_Type);
        com.Parameters.AddWithValue("@IsActive", IsActive);
        com.Parameters.AddWithValue("@Srl_Department", Srl_Department);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
   
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_Course", Srl);
    }
    #endregion
    #region Select
    public static DataTable GetAllCourseSrl()
    {
        return PublicFunction.d.GetDataTable(@"select convert(varchar, CAS_Course.Code)+'-'+" +
                                            @" convert(varchar, CAS_Group.Code) + '-' +"+
                                            @" convert(varchar, CAS_Department.Code) as code, CAS_Course.srl"+
                                             @" from CAS_course, CAS_Department, CAS_Group"+
                                            @" where CAS_course.Srl_Department = CAS_Department.srl"+
                                            @" and Srl_Group = CAS_Group.srl");
    }
    public static DataTable GetAllCourse()
    {
        
        return PublicFunction.d.GetDataTable("CAS_Course","");
    }
    public static DataTable GetTermCourse(int Srl_Group)
    {
        DataAccess d = new global::DataAccess();
        return PublicFunction.d.GetDataTable("cas_Course", "srl_Group=" + Srl_Group.ToString());
    }
    public Course(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Name = Dr["Name"].ToString();
            Code = Dr["Code"].ToString();
            Srl_Type = Convert.ToInt32(Dr["Srl_Type"]);
            Srl_Group = Convert.ToInt32(Dr["Srl_Group"]);
            Srl_Department = Convert.ToInt32(Dr["Srl_Department"]);
            IsActive = Convert.ToBoolean(Dr["AsActive"]);




        }
    }
    public static DataRow GetCourseCode(String code)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Course", "Code=" + code);
        if (Dr != null)
        {
            return Dr;

        }
        return null;
    }
    public static bool searchCourseCode(string code, string group, string department)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Course", "Code=" + code + " and Srl_Group=" + group + " and Srl_Department=" + department);
        if (Dr != null)
        {
            return true;
        }


        return false;
    }
    #endregion
    #region Admin
    public static DataTable GetManageCourseData(string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetManageCourseData", " Srl_term=" + Term);
    }
    #endregion

    #region Student
    public static DataTable GetStudentCourseData(string Srl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetStudentCourseData", "Srl_Student=" + Srl + "and Srl_term=" + Term);
    }
    #endregion

    #region Teacher
    public static DataTable GetTeacherCourseData(string Srl, string Term)
    {
        
        return PublicFunction.d.GetDataTable("Vw_GetTeacherCourseData", "Srl_master=" + Srl + " and Srl_term=" + Term);
    }
    #endregion
    #region ListStudent
    public static DataTable GetTeacherListStudentData(int Srl, string Term)
    {
        DataAccess d = new DataAccess();
        return d.GetDataTable("Vw_GetTeacherListStudentData", "Srl_Erae=" + Srl.ToString() + "and Srl_Term=" + Term);
    }
    #endregion

    #region Activity
    
        public static string GetTeacherCourseName(int CourseSrl)
    {
        
        DataRow Dr = PublicFunction.d.GetRow("CAS_Course", "Srl=" + CourseSrl.ToString());
        if (Dr != null)
        {
            string Nam = Dr["Name"].ToString();
            return Nam;
        }
        return null;
    }
    #endregion

}