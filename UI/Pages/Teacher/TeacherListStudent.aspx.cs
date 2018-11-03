using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UI_Pages_Teacher_TeacherListStudent : System.Web.UI.Page
{
    public DataTable AllStudent;
    public int Count;
    public string Srl;
    public int EraeSrl;
    public string Term;
    public int j;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}