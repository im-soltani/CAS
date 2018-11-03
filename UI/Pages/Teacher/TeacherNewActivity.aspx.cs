using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

public partial class UI_Pages_Teacher_TeacherNewActivity : System.Web.UI.Page
{
    public DataTable AllStudent;
    public int EraeSrl;
    public string Term;
    public string Srl;
    public int Count;
    public int j;

    protected void Page_Load(object sender, EventArgs e)
    {
        JavaScriptSerializer hh = new JavaScriptSerializer();
        //Response.Write(hh.Serialize(Convert.ToInt32(Request.QueryString["SessionSrl"])));
        //Response.End();
        if (Request.QueryString["Delay"] != null )
        {
            ActivityGrade ActivityGrade_cs = new ActivityGrade();


            ActivityGrade_cs.Srl_Activity = Convert.ToInt32(Request.QueryString["SessionSrl"]);
            ActivityGrade_cs.Srl_Student = Convert.ToInt32(Request.QueryString["StudentSrl"]);
            if (Convert.ToInt32(Request.QueryString["Delay"]) != 0 && Convert.ToInt32(Request.QueryString["Absent"]) != 0)
            {
                ActivityGrade_cs.Grade = Convert.ToInt32(Request.QueryString["Grade"]);
            }
            else if (Convert.ToInt32(Request.QueryString["Grade"]) == 0 && Convert.ToInt32(Request.QueryString["Absent"]) == 0)
            {
                ActivityGrade_cs.Grade = -1;
            }
            bool Result = ActivityGrade_cs.Insert();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            Dictionary<string, int> data = new Dictionary<string, int>();

            if (Result == true)
            {
                data["code"] = 200;

            }
            else
            {
                data["code"] = 500;
            }

            Response.Write(serializer.Serialize(data));
            Response.End();
        }

    }

    //protected void _btn_Save_ServerClick(object sender, EventArgs e)
    //{
    //    int i = 0;
    //    for (i = 0; i < Count; i++)
    //    {
    //        if (i == 0)
    //        {
    //            // L_Message.Text = "لطفا نمرات را وارد نمایید.";
    //        }
    //        else
    //        {
    //            Activity.InsertGradeHomWorkData(i);

    //        }
    //    }

    //    Response.Redirect("http://localhost:16354/UI/Pages/Teacher/TeacherNewAPChecking.aspx");
    //}

    public static void InsertStudentGradeActivityData(string _Grade)
    {
        double Grade = Convert.ToDouble(_Grade);
        ActivityGrade Grade_sc = new ActivityGrade();
        bool result;
        Grade_sc.Grade=Grade;
        result = Grade_sc.Insert();

        result = true;
            if (result==true)
            {

             //Response.Redirect("~/UI/Pages/Teacher/TeacherNewAPChecking.aspx");

        }

    }  
  
}