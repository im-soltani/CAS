using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UI_Pages_Teacher_TeacherAPChecking : System.Web.UI.Page
{
    public DataTable AllAPChecking;
    public int Count;
    public string Srl;
    public int EraeSrl;
    public string Term ;
    public int j;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["asrl"] != null && Request.QueryString["asrl"] != "" && Request.QueryString["EraeSrl"] != null && Request.QueryString["EraeSrl"] != "")
        {
            int ID = Convert.ToInt32(Request.QueryString["asrl"]);
            EraeSrl = Convert.ToInt32(Request.QueryString["EraeSrl"]);
            //پیغام خطا 
            bool result = APChecking.Delete(ID);
            if (result != false)
            {
                Response.Redirect("http://localhost:16354/UI/Pages/Teacher/TeacherAPChecking.aspx?EraeSrl="+ EraeSrl);
            }
        }
    }

    protected void _btn_Saved_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:16354/UI/Pages/Teacher/NewHomeWork.aspx");

    }
}