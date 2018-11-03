using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UI_Pages_Teacher_TeacherProfile : System.Web.UI.Page
{
    public DataRow TeacherData;
    public DataRow AllDayOfWeak;
    public DataRow GroupName;
    public string Srl;
    public string Term;
    public string TermSrl;
    public int Count;
 
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Teacher Teacher_cs = new Teacher();
        string Pic = _Picture.FileName;
        _Picture.SaveAs(Server.MapPath("~/Picture/TeacherPicture/" + Srl));
        Srl = Session["TeacherSrl"] as string;

        Teacher_cs.srl = Convert.ToInt32(Srl);
        Teacher_cs.Name = _Name.Value;
        Teacher_cs.Family = _Family.Value;
        Teacher_cs.Code = Convert.ToInt32(_Code.Value);
        Teacher_cs.Mobile = _Mobile.Value;
        Teacher_cs.Email = _Email.Value;
        Teacher_cs.TelegramID = _TelgramID.Value;
        Teacher_cs.Picture = Srl;
        Teacher_cs.IsActive = true;
        bool Temp = Teacher_cs.Update();
        if (Temp == true)
        {
            Response.Redirect("~/UI/Pages/Teacher/TeacherProfile.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Manage_User User_cs = new Manage_User();

        DataRow Result = Manage_User.IsValidUser(_OldUserName.Value, _OldPassWord.Value);

        if (Result != null && _PassWord.Value == _RPassWord.Value)
        {
            string PassWord = Manage_User.HashSHA1(_PassWord.Value);

            User_cs.srl = Convert.ToInt32(Result["Srl"]);
            User_cs.UserName = _NewUserName.Value;
            User_cs.PassWord = PassWord;
            User_cs.Srl_Role = 1;
            User_cs.IsActive = true;
            bool Temp = User_cs.Update();
            if (Temp == true)
            {
                Response.Redirect("~/UI/Pages/Teacher/TeacherProfile.aspx");
            }
        }
    }
}