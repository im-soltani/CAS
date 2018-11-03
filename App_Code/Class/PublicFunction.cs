using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Text;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Threading.Tasks;
using System.Xml;
using System.Net.Http;
using System.Collections;


class PublicFunction
{
    static public DataAccess d=new DataAccess();
    static public string TermStartDate = Term.GetTermStartDate(1);
    static public string TermEndDate = Term.GetTermEndDate(1);
    public PublicFunction()
    { 
    }
    public static string ConvertCoding(string Input)
    { 
        return  Input.Replace("ك", "ک").Replace("ي", "ی");
    }
    public static Dictionary<string, int> GetGroupData()
    {
        Dictionary<string, int> data = new Dictionary<string, int>();

        DataTable dt = Group.GetAllGroup();
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!data.ContainsKey(dr["Code"].ToString()))
                    data.Add(dr["Code"].ToString(), Convert.ToInt32(dr["srl"]));
            }

        }
        return data;
    }
    public static Dictionary<string, int> GetstudentData()
    {
        Dictionary<string, int> data = new Dictionary<string, int>();

        DataTable dt = Student .GetAllStudent();
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!data.ContainsKey(dr["Code"].ToString()))
                    data.Add(dr["Code"].ToString(), Convert.ToInt32(dr["srl"]));
            }
        }
        return data;
    }
    public static Dictionary<string, int> GetDepartmentData()
    {
        Dictionary<string, int> data = new Dictionary<string, int>();

        DataTable dt = Department.GetAllDepartment();
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!data.ContainsKey(dr["Code"].ToString()))
                    data.Add(dr["Code"].ToString(), Convert.ToInt32(dr["srl"]));
            }

        }
        return data;
    }
    public static Dictionary<string, int> GetCourseData()
    {
        Dictionary<string, int> data = new Dictionary<string, int>();

        DataTable dt = Course.GetAllCourseSrl();
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!data.ContainsKey(dr["Code"].ToString()))
                    data.Add(dr["Code"].ToString(), Convert.ToInt32(dr["srl"]));
            }

        }
        return data;
    }
    public static int GetDayNumber(string Day)
    {
        switch (Day)
        {
            case "شنبه":
                return 0;
            case "يك شنبه":
                return 1;
            case "دو شنبه":
                return 2;
            case "سه شنبه":
                return 3;
            case "چهار شنبه":
                return 4;
            case "پنج شنبه":
                return 5;
            case "جمعه":
                return 6;
            default:
                return -1;
        }
    }
    public static int GetDayNumberFunction(string Day)
    {
        switch (Day)
        {
            case "شنبه":
                return 0;
            case "یکشنبه":
                return 1;
            case "دوشنبه":
                return 2;
            case "سه شنبه":
                return 3;
            case "چهار شنبه":
                return 4;
            case "پنج شنبه":
                return 5;
            case "جمعه":
                return 6;
            default:
                return -1;
        }
    }
    public static int GetSessionType(string Type)
    {
        switch (Type)
        {
            case "هفته هاي زوج":
                return 0;
            case "هفته هاي فرد":
                return 1;
            case "هرهفته":
                return 2;
            default:
                return -1;
        }
    }
    public static Dictionary<string, int> GetMasterData()
    {
        Dictionary<string, int> data = new Dictionary<string, int>();
        DataTable dt = Teacher.GetTeacherData();
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!data.ContainsKey(dr["Code"].ToString()))
                    data.Add(dr["Code"].ToString(), Convert.ToInt32(dr["srl"]));
            }

        }
        return data;
    }
    public static Dictionary<string, int> GetEraeData(int Srl_Term)
    {
        Dictionary<string, int> data = new Dictionary<string, int>();
        DataTable dt = Erae.GetEraeOfTerm(Srl_Term);
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                string temp = dr["Srl_Course"].ToString() + "-" + dr["Srl_Master"].ToString() + "-" + dr["Srl_Term"].ToString() + "-" + dr["Code"].ToString();
                if (!data.ContainsKey(temp))
                    data.Add(temp, Convert.ToInt32(dr["Srl"]));
                else
                    if(1<1);
            }

        }
        return data;
    }
    public static string[] GetHolidayData()
    {
      
        DataTable dt = Holiday.GetAllHoliday();
        if (dt != null)
        {
            string[] temp = new string[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
                temp[i] = dt.Rows[i]["Tarikh"].ToString();
            return temp;
        }
        return null;
    }
}
