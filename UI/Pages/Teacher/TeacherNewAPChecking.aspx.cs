using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;

public partial class UI_Pages_Teacher_TeacherNewAPChecking : System.Web.UI.Page
{
    public DataTable AllAPStudent;
    public int Count;
    public string Srl;
    public int EraeSrl;
    public string Term;
    public int j;

    protected void Page_Load(object sender, EventArgs e)
    {
        JavaScriptSerializer hh = new JavaScriptSerializer();
        //Response.Write(hh.Serialize(Convert.ToInt32(Request.QueryString["SessionSrl"])));
        //Response.End();
        if (Request.QueryString["Delay"] != null && Request.QueryString["Absent"] != null)
        {
            APChecking APChecking_cs = new APChecking();
            

            APChecking_cs.Srl_Session = Convert.ToInt32(Request.QueryString["SessionSrl"]);
            APChecking_cs.Srl_Student = Convert.ToInt32(Request.QueryString["StudentSrl"]);
            if (Convert.ToInt32(Request.QueryString["Delay"]) != 0 && Convert.ToInt32(Request.QueryString["Absent"])!= 0)
            { 
                APChecking_cs.Delay = Convert.ToInt32( Request.QueryString["Delay"]);
            }
           else if (Convert.ToInt32(Request.QueryString["Delay"]) == 0 && Convert.ToInt32(Request.QueryString["Absent"]) == 0)
            {
                APChecking_cs.Delay = -1;
            }
            bool Result=APChecking_cs.Insert();
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


}