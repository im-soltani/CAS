using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class UI_Pages_Student_StudentActivityDetail : System.Web.UI.Page
{
    public string path;
    public string Srl;
    public string Term;
    public int ActivityGradeSrl;
    public int EraeSrl;


    protected void Page_Load(object sender, EventArgs e)
    {
        Srl = Session["StudentSrl"] as string;
        Term = Session["TermSrl"] as string;
        ActivityGradeSrl = Convert.ToInt32(Request.QueryString["ActivityGradeSrl"]);
        EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);


        DataRow DesActivity = ActivityGrade.GetActivityGradeData(ActivityGradeSrl);
        MasterDescription.Text = DesActivity["Description"].ToString();
    }


    protected void Save_Click(object sender, EventArgs e)
    {
        StudentActivity StudentActivity_cs = new StudentActivity();
        DateTime UTCNow = DateTime.UtcNow;
        string year = Convert.ToString(UTCNow.Year);
        string month = Convert.ToString(UTCNow.Month);
        string day = Convert.ToString(UTCNow.Day);
        string hour = Convert.ToString(UTCNow.Hour);
        string min = Convert.ToString(UTCNow.Minute);
        string sec = Convert.ToString(UTCNow.Second);

        EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
        string FileActivity = _FileActivity.FileName;

        StudentActivity_cs.Srl_Activity = Convert.ToInt32(Request.QueryString["ActivitySrl"]);
        StudentActivity_cs.Srl_Student = Convert.ToInt32(Srl);
        StudentActivity_cs.RegDate = year + "/" + month + "/" + day;
        StudentActivity_cs.RegTime = hour + ":" + min + ":" + sec;
        StudentActivity_cs.DocumentFile = FileActivity;
        StudentActivity_cs.Description = _Description.Value;
        bool Result = StudentActivity_cs.Insert();
        if (Result == true)
        {
            DataRow StudentActivityData = StudentActivity.GetStudentActivityData(Convert.ToInt32(Request.QueryString["ActivitySrl"]));
            _FileActivity.SaveAs(Server.MapPath("~/File/Activity/StudentActivity/" + StudentActivityData["Srl"]+".pdf"));


            Response.Redirect("~/UI/Pages/Student/StudentHomeWork.aspx?EraeSrl=" + EraeSrl);
        }
    }
}