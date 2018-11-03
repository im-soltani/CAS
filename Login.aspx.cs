using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class Login : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        //Session.RemoveAll();
    }

   protected void _btn_login_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (_txt_UserName.Value != "" && _txt_PassWord.Value != "")
            {
                DataRow TermSrl = Term.GetActiveTerm();
                Session.Add("TermSrl", TermSrl["Srl"].ToString());

                //Call Method
                DataRow result = Manage_User.IsValidUser(_txt_UserName.Value, _txt_PassWord.Value);
                if (result == null)
                {
                    //L_Message.Text = "لطفا اطلاعات را زیر را وارد نمایید.";
                    return;
                }
                if (Convert.ToInt32(result["Srl_Role"]) == 1)
                {
                    DataRow TeacherSrl = Teacher.GetTeacherSrl(result["Srl_User"].ToString());
                    Session.Add("TeacherSrl", TeacherSrl["Srl"].ToString());
                    Response.Redirect("~/UI/Pages/Teacher/TeacherProfile.aspx");
                }
                else if (Convert.ToInt32(result["Srl_Role"]) == 2)
                {
                    DataRow StudentSrl = Student.GetStudentSrl(result["Srl_User"].ToString());
                    Session.Add("StudentSrl", StudentSrl["Srl"].ToString());
                    Response.Redirect("~/UI/Pages/Student/StudentProfile.aspx");
                }

                else if (Convert.ToInt32(result["Srl_Role"]) == 3)
                {
                    Response.Redirect("~/UI/Pages/Admin/Dashboard.aspx?Srl=" + result["Srl"].ToString());
                }
            }
            else
            {
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "SetTimeout()", "Alert()", true);
               //Response.Write("<script LANGUAGE="JavaScript" > alert("لطفا نام کاربری و رمز عبور را وارد نمایید .")</script>");
            }
        }

        catch (Exception ex)
        {
            
        }
    }
}

