using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;
public class JsonRes
{
    public int code;
    public object message;
    public string TermSrl;
}

public partial class UI_Pages_Student_StudentCourse : System.Web.UI.Page
{
    public DataTable AllCourse;
    public string Srl;
    public string TermSrl ;
    public int j;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["GetCourseList"] != null)
        {
            StudentCourse(Request.QueryString["GetCourseList"]);
            Response.End();

            return;
        }

    }

    public void StudentCourse(string TermSrl)
    {
         
        //TermSrl = Session["TermSrl"] as string;
        Srl = Session["StudentSrl"] as string;

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        AllCourse = Course.GetStudentCourseData(Srl, TermSrl);
        JsonRes Res = new JsonRes();

        Res.TermSrl = Term.GetTermData(TermSrl);

        List<Dictionary<string, string>> output = new List<Dictionary<string, string>>();
        if (AllCourse != null)
        {
            int count = AllCourse.Rows.Count;
            //System.Diagnostics.Debug.WriteLine(AllFoods.Columns.Count);
            for (int i = 0, j = 1; i < count; i++, j++)
            {
                Dictionary<string, string> data = new Dictionary<string, string>();

                data["id"] = j.ToString();

                data["CourseName"] = AllCourse.Rows[i]["NameCourse"].ToString();

                data["Code"] = AllCourse.Rows[i]["CodeErae"].ToString() + "_" + AllCourse.Rows[i]["Srl_Department"].ToString() + "" + AllCourse.Rows[i]["Srl_Group"].ToString() + "" + AllCourse.Rows[i]["Code"].ToString();

                data["Name"] = AllCourse.Rows[i]["Name"].ToString() + " " + AllCourse.Rows[i]["Family"].ToString();

                data["SumActivity"] = Activity.GetSumActivity(Srl, AllCourse.Rows[i]["Srl_Erae"].ToString()) + " از" + Activity.GetSumAllActivity(Srl, AllCourse.Rows[i]["Srl_Erae"].ToString());

                data["SumAPChecking"] = APChecking.GetSumAPChecking(Srl, AllCourse.Rows[i]["Srl_Erae"].ToString()).ToString();

                data["Activity"] = "StudentHomeWork.aspx?EraeSrl="+AllCourse.Rows[i]["Srl_Erae"].ToString();

                data["APChecking"] = "StudentAPChecking.aspx?EraeSrl="+AllCourse.Rows[i]["Srl_Erae"].ToString();

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