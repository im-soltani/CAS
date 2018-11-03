using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UI_Pages_Teacher_TeacherActivityDetail : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Activity Activity_cs = new Activity();


        DateTime UTCNow = DateTime.UtcNow;
        string year = Convert.ToString(UTCNow.Year);
        string month = Convert.ToString(UTCNow.Month);
        string day = Convert.ToString(UTCNow.Day);

        string _DocumentFile = _File.FileName;

        float _grade = float.Parse(_Grade.Value);
        float _finalpercent = float.Parse(_FinalPercent.Value);

        Activity_cs.Title = _Name.Value;
        Activity_cs.DeadlineDate = _Tarikh.Value;
        Activity_cs.DeadlineTime = _Time.Value;
        Activity_cs.RegDate = year + "/" + month + "/" + day;
        Activity_cs.Grade = _grade;
        Activity_cs.FinalPercent = _finalpercent;
        Activity_cs.Description = _Description.Value;
        Activity_cs.DocumentFile = _DocumentFile;
        Activity_cs.IsActive = true;
        Activity_cs.Srl_Erae = Convert.ToInt32(Request.QueryString["EraeSrl"]);
        bool Result = Activity_cs.Insert();
        if (Result != false)
        {
            DataRow SrlActivity = Activity.GetSrlActivityData(_Name.Value);
            _File.SaveAs(Server.MapPath("~/File/Activity/TeacherActivity/" + SrlActivity["Srl"]));

            Response.Redirect("~/UI/Pages/Teacher/TeacherNewActivity.aspx?EraeSrl=" + Convert.ToInt32(Request.QueryString["EraeSrl"]));
        }
    }
}