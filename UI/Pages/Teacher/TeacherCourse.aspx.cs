using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.Script.Serialization;


public partial class UI_Pages_Teacher_TeacherCourse : System.Web.UI.Page
{
    public DataTable AllCourse;
    public string Srl;
    public int j;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["GetCourseList"] != null)
        {
            TeacherCourse(Request.QueryString["GetCourseList"]);
            Response.End();

            return;
        }
    }

    public void TeacherCourse(string TermSrl)
    {

        Srl = Session["TeacherSrl"] as string;
        //Term = Session["TermSrl"] as string;
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        AllCourse = Course.GetTeacherCourseData(Srl, TermSrl);
        JsonRes Res = new JsonRes();

        Res.Term = Term.GetTermData(TermSrl);

List < Dictionary<string, string>> output = new List<Dictionary<string, string>>();
        if (AllCourse != null)
        {
            int count = AllCourse.Rows.Count;
            //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
            for (int i = 0, j = 1; i < count; i++, j++)
            {
                Dictionary<string, string> data = new Dictionary<string, string>();

                data["id"] = j.ToString();

                data["Name"] = AllCourse.Rows[i]["Name"].ToString();

                data["CodeErae"] = AllCourse.Rows[i]["CodeErae"].ToString() + "_" + AllCourse.Rows[i]["Srl_Department"].ToString() + "" + AllCourse.Rows[i]["Srl_Group"].ToString() + "" + AllCourse.Rows[i]["Code"].ToString();

                data["SumFinalPercent"] = Activity.GetSumFinalPercent(AllCourse.Rows[i]["Srl"].ToString()) + "از  100 ";

                data["GetSumMeeting"] = APChecking.GetSumMeetingHeld(AllCourse.Rows[i]["Srl"].ToString()).ToString();

                data["EraeSrl"] = "TeacherListStudent.aspx?EraeSrl=" + AllCourse.Rows[i]["Srl"].ToString();

                data["TeacherActivity"] = "TeacherActivity.aspx?EraeSrl=" + AllCourse.Rows[i]["Srl"].ToString();

                data["TeacherAPChecking"] = "TeacherAPChecking.aspx?EraeSrl=" + AllCourse.Rows[i]["Srl"].ToString();


                output.Add(data);

            }


            Res.code = 200;
            Res.message = output;
            Response.Write(serializer.Serialize(Res));
            return;
        }
        Res.code = 500;
        Res.message = "Error";
        Response.Write(serializer.Serialize(Res));
        return;
    }
}