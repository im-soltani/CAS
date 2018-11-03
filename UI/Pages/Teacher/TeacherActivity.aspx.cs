using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;

public partial class UI_Pages_Teacher_TeacherActivity : System.Web.UI.Page
{

    public DataTable AllHomeWork;
    public int Count;
    public string TermSrl;
    public string Srl;
    public int EraeSrl;
    public int ID;
    public string Description;
    public int j;
    protected void Page_Load(object sender, EventArgs e)
    {
        //    EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
        //    ID= Convert.ToInt32(Request.QueryString["srl"]);

        ////پیغام خطا 
        //bool result = Activity.Delete(ID);
        //    if (result != false)
        //    {
        //        Response.Redirect("~/UI/Pages/Teacher/TeacherActivity.aspx?EraeSrl=" + EraeSrl);
        //    }


        //JavaScriptSerializer hh = new JavaScriptSerializer();

        //if (Request.QueryString["Name"] != null && Request.QueryString["CourseName"] != null)
        //{
        //    Activity Activity_cs = new Activity();

        //    Activity_cs.Title = Request.QueryString["Name"];
        //    Activity_cs.Srl_Erae = Convert.ToInt32(Request.QueryString["EraeSrl"]);
        //    Activity_cs.DeadlineDate = Request.QueryString["Tarikh"];
        //    Activity_cs.DeadlineTime = Request.QueryString["_Time"];
        //    Activity_cs.DocumentFile = Request.QueryString["_File"];
        //    Activity_cs.Description = Request.QueryString["_Description"];
        //    Activity_cs.FinalPercent = Convert.ToInt32(Request.QueryString["FinalPercent"]);
        //    Activity_cs.Grade = Convert.ToInt32(Request.QueryString["Grade"]);

        //    DateTime UTCNow = DateTime.UtcNow;
        //    string year = Convert.ToString(UTCNow.Year);
        //    string month = Convert.ToString(UTCNow.Month);
        //    string day = Convert.ToString(UTCNow.Day);

        //    Activity_cs.RegDate = year + "/" + month + "/" + day;

        //    bool Result = Activity_cs.Insert();
        //    JavaScriptSerializer serializer = new JavaScriptSerializer();
        //    Dictionary<string, int> data = new Dictionary<string, int>();

        //    if (Result == true)
        //    {
        //        data["code"] = 200;

        //    }
        //    else
        //    {
        //        data["code"] = 500;
        //    }

        //    Response.Write(serializer.Serialize(data));
        //    Response.End();
        //}

    }

}