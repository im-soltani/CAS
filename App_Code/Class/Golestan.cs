using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Threading.Tasks;
using System.Xml;
using System.Net.Http;


/// <summary>
/// Summary description for Golestan
/// </summary>
public class Golestan
{
    public Golestan()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private static readonly HttpClient client = new HttpClient();

    public IEnumerable<XmlNode> XN { get; private set; }

    public static async void ImportStudentInfo(string Srl_Term)
    {
        Dictionary<string, int> GroupData = PublicFunction.GetGroupData();
        Dictionary<string, int> StudentData = PublicFunction.GetstudentData();

        if (Srl_Term != "")
        {
            DataTable Dt = Department.GetAllDepartment();
            if (Dt != null)
                foreach (DataRow dr in Dt.Rows)
                {
                    try
                    {
                        string TempDepartment = dr["Code"].ToString();
                        var values = new Dictionary<string, string> {
                        { "login", "report" },
                        { "pass", "RKXMSDrkxmsd123" },
                        { "sec","AA0ECD9901"},
                        { "Pub","<Root>"+
                         "<N id=\"1\" F1=\"0\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+
                           "<N id=\"4\" F1=\"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+
                        "<N id=\"28\" F1=\""+Srl_Term+"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+ 
                        "<N id=\"18\" F1=\""+TempDepartment+"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+
                       //  "<N id=\"20\" F1=\"31\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+
                         "</Root>"},
                        { "Pri","<Root><N UQID=\"245\" id=\"5\" F=\"0\" T=\"\" />"+
                                       "<N UQID=\"10\" id=\"10\" F=\"\" T=\"\" />"+
                                       //"<N UQID=\"153\" id=\"20\" F=\"\" T=\"\" />"+
                                       //"<N UQID=\"17450\" id=\"24\" F=\"\" T=\"\" />"+
                                       "</Root>" },

                        { "Mor","" },
                        { "iFID","1132"}
                    };
                        var url = string.Format("https://golestan.qiet.ac.ir/GolestanService/gservice.asmx/golInfo?{0}",
                        string.Join("&",
                        values.Select(kvp =>
                        string.Format("{0}={1}", kvp.Key, kvp.Value))));
                        XmlDocument d = new XmlDocument();
                        string result = await client.GetStringAsync(url);
                        string query = "";
                        d.LoadXml(result);
                        XmlNodeList XN = d.SelectNodes("/Root/p");
                        foreach (XmlNode x in XN)
                        {
                            try
                            {
                                if (!StudentData.ContainsKey(x.Attributes["c1"].Value))
                                    query += " Insert Into CAS_Student values (N'" + x.Attributes["c2"].Value + "',N'" + x.Attributes["c3"].Value + "'," + x.Attributes["c1"].Value + ",N'',"+GroupData[x.Attributes["c4"].Value] +",N'',N'',N'',1)";
                            }
                            catch { }
                        }
                        PublicFunction.d.ExecQuery(query);

                    }
                    catch (Exception ex)
                    {

                    }
                }
        }
    }
    public static async void ImportCourseData()
    {
        Dictionary<string, int> CourseData = PublicFunction.GetCourseData();
        Dictionary<string, int> GroupData = PublicFunction.GetGroupData();
        Dictionary<string, int> DepartmentData = PublicFunction.GetDepartmentData();
        var values = new Dictionary<string, string> {
                { "login", "report" },
                { "pass", "RKXMSDrkxmsd123" },
                { "sec","8B31DE7909"},
                { "Pub","<Root></Root>"},
                { "pri","<Root><N UQID=\"324\" id=\"2\" F=\"0\" T=\"\" /></Root>"},
                { "mor",""},
                { "iFID","1133"}
            };
        var url = string.Format("https://golestan.qiet.ac.ir/GolestanService/gservice.asmx/golInfo?{0}",
        string.Join("&",
        values.Select(kvp =>
        string.Format("{0}={1}", kvp.Key, kvp.Value))));
        try
        {
            int Count = 0;
            //  string Group= this.Group.Text;
            string a = await client.GetStringAsync(url);
            XmlDocument d = new XmlDocument();
            d.LoadXml(a);
            string query = "";
            XmlNodeList XN = d.SelectNodes("/Root/p");
            foreach (XmlNode x in XN)
            {
                try
                {
                    if (!CourseData.ContainsKey(x.Attributes[0].Value))
                    {
                        string temp1 = x.Attributes[0].Value;
                        query += " Insert into CAS_Course values(N'" + x.Attributes["c2"].Value + "','" + temp1.Substring(0, temp1.IndexOf('-')) + "'," + GroupData[x.Attributes["c3"].Value].ToString() + "," + DepartmentData[x.Attributes["c4"].Value].ToString() + ",3,1)";
                    }
                }
                catch (Exception ex)
                {
                    Count--;
                }

            }
            PublicFunction.d.ExecQuery(query);
        }
        catch (Exception ex)
        {

        }
    } 
    public static async void ImportMasterData(string term)
    {
        Dictionary<string, int> MasterData = PublicFunction.GetMasterData ();

        if (term != "")
        {
            string query = "";
            DataTable Dt = Department.GetAllDepartment();
            if (Dt != null)
                foreach (DataRow dr in Dt.Rows)
                {
                    string TempDepartment = dr["Code"].ToString();
                   // string TempDepartment = "30";
                    string TempTerm = term;
                    // string Temp = Term1.GetActiveTerm();
                    var values = new Dictionary<string, string> {
                { "login", "report" },
                { "pass", "RKXMSDrkxmsd123" },
                { "sec","1977AD6355"},
                { "pub",("<Root>"+
                          "<N id=\"4\" F1=\""+TempTerm+"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+
                         "<N id=\"12\" F1=\""+TempDepartment+"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" /></Root>")},
                { "pri","<Root><N UQID=\"278\" id=\"2\" F=\"0\" T=\"\" /></Root>"},
                { "mor",""},
                { "iFID","1134"}
                 };
                    var url = string.Format("https://golestan.qiet.ac.ir/GolestanService/gservice.asmx/golInfo?{0}",
                    string.Join("&",
                    values.Select(kvp =>
                    string.Format("{0}={1}", kvp.Key, kvp.Value))));
                    try
                    {
                        string a = await client.GetStringAsync(url);
                        XmlDocument d = new XmlDocument();
                        d.LoadXml(a);
                        XmlNodeList XN = d.SelectNodes("/Root/p");
                        foreach (XmlNode x in XN)
                        {
                            try
                            {
                                if ((x.Attributes["c5"].Value).Trim()!="" && !MasterData.ContainsKey((x.Attributes["c5"].Value)))
                                {
                                    query += " Insert Into CAS_Master values(N'" + x.Attributes["c3"].Value + "',N'" + x.Attributes["c4"].Value + "'," + x.Attributes["c5"].Value + ",31,N'',N'',N'09150000000',N'',1)";
                                    MasterData.Add(x.Attributes["c5"].Value, 0);
                                }
                            }
                            catch { }
                        }
                        ///View courses added.
                    }
                    catch (Exception ex)
                    {

                    }
                }
            PublicFunction .d.ExecQuery(query );
        }
    }
    public static async void ImportEraeData(String term)
    {
        Dictionary<string, int> MasretData = PublicFunction.GetMasterData ();
        Dictionary<string, int> CourseData = PublicFunction.GetCourseData();
        Dictionary<string, int> GroupData = PublicFunction.GetGroupData();
        Dictionary<string, int> EraeData = PublicFunction.GetEraeData(Convert.ToInt32( Term.GetTermSrl(term)));

        int  srlTerm =Convert .ToInt32( Term.GetTermSrl(term));
        if (term != "")
        {
            DataTable Dt = Department.GetAllDepartment();
            if (Dt != null)
                foreach (DataRow dr in Dt.Rows)
                {
                    string TempDepartment = dr["Code"].ToString();
                    //string TempDepartment = "30";
                    string TempTerm = term;
                    var values = new Dictionary<string, string> {
             { "login", "report" },
                { "pass", "RKXMSDrkxmsd123" },
                { "sec","1977AD6355"},
                { "pub",("<Root>"+
                          "<N id=\"4\" F1=\""+TempTerm+"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" />"+
                         "<N id=\"12\" F1=\""+TempDepartment+"\" T1=\"\" F2=\"\" T2=\"\" A=\"\" S=\"\" Q=\"\" B=\"\" /></Root>")},
                { "pri","<Root><N UQID=\"278\" id=\"2\" F=\"0\" T=\"\" /></Root>"},
                { "mor",""},
                { "iFID","1134"}
            };
                    var url = string.Format("https://golestan.qiet.ac.ir/GolestanService/gservice.asmx/golInfo?{0}",
                string.Join("&",
                    values.Select(kvp =>
                        string.Format("{0}={1}", kvp.Key, kvp.Value))));
                    try
                    {

                        string a = await client.GetStringAsync(url);
                        XmlDocument d = new XmlDocument();
                        d.LoadXml(a);
                        string query = "";
                        XmlNodeList XN = d.SelectNodes("/Root/p");
                        foreach (XmlNode x in XN)
                        {
                            try
                            {

                                Erae SD = new Erae();
                                SD.Group = Convert.ToInt32(x.Attributes["c15"].Value);
                                SD.Srl_Term = srlTerm;
                                SD.IsActive = true;
                                // get master code
                                string srl = x.Attributes["c5"].Value.Trim();
                                if (srl == "")
                                    continue;
                                SD.Srl_Master = MasretData[srl];
                                string temp = x.Attributes["c2"].Value;
                                string Code = temp.Substring(0, temp.IndexOf('-'));
                                SD.Srl_Course = CourseData[temp];
                                string tempErae = SD.Srl_Course + "-" + SD.Srl_Master + "-" + SD.Srl_Term + "-" + SD.Group;
                                query += " Insert Into CAS_TempErae values(" + SD.Srl_Course + "," + SD.Srl_Master + "," + SD.Srl_Term + "," + SD.Group + ",1)";
                                if (!EraeData.ContainsKey(tempErae))
                                {
                                    EraeData.Add(tempErae, 0);
                                    query += " Insert Into CAS_Erae values(" + SD.Srl_Course + "," + SD.Srl_Master + "," + SD.Srl_Term + "," + SD.Group + ",1)";
                                }
                            }
                            catch { }
                        }
                        PublicFunction.d.ExecQuery(query);
                        EraeData = PublicFunction.GetEraeData(Convert.ToInt32(Term.GetTermSrl(term)));
                        query = "";
                        Dictionary<string, int> EraeTimeData= new Dictionary<string, int>();
                        foreach (XmlNode x in XN)
                        {
                            try
                            {

                                Erae SD = new Erae();
                                SD.Group = Convert.ToInt32(x.Attributes["c15"].Value);
                                SD.Srl_Term = srlTerm;
                                string srl = x.Attributes["c5"].Value.Trim();
                                if (srl == "")
                                    continue;
                                SD.Srl_Master = MasretData[srl];
                                string temp = x.Attributes["c2"].Value;
                                string Code = temp.Substring(0, temp.IndexOf('-'));
                                SD.Srl_Course = CourseData[temp];
                                string tempErae = SD.Srl_Course + "-" + SD.Srl_Master + "-" + SD.Srl_Term + "-" + SD.Group;
                                int Srl = EraeData[tempErae];
                                
                                if (Srl != 0 && !EraeTimeData .ContainsKey(Srl.ToString()))
                                {
                                    EraeTimeData.Add(Srl.ToString(), 0);
                                    string TempStartTime;
                                    string TempEndTime;
                                    string TempType;
                                    string TempDay;
                                    string tempSession = x.Attributes["c6"].Value;
                                    string[] session = tempSession.Split('،');
                                    for (int i = 0; i < session.Length; i += 3)
                                    {
                                        TempType = session[i].Trim();
                                        TempDay = session[i + 1].Trim();
                                        TempStartTime = session[i + 2].Trim().Substring(0, 5);
                                        TempEndTime = session[i + 2].Trim().Substring(6);
                                        query += " Insert Into CAS_EraeTime values (" + Srl.ToString() + "," + PublicFunction.GetDayNumber(TempDay).ToString() + ",N'" + TempStartTime + "',N'" + TempEndTime + "'," + PublicFunction.GetSessionType(TempType).ToString() + ")";
                                        EraeTime et = new global::EraeTime();
                                        query += Session.InsertSession(Srl, PublicFunction.TermStartDate, PublicFunction.TermEndDate, PublicFunction.GetSessionType(TempType), TempDay, TempStartTime, TempEndTime);
                                    }
                                    
                                }
                            }
                            catch { }
                           
                        }
                        PublicFunction.d.ExecQuery(query);
                    }

                    catch (Exception ex)
                    {

                    }
                }
        }
    }
}