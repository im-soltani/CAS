using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SessionClass
/// </summary>
public class SessionClass
{
    public SessionClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    int _Srl_Erae;
    string _Tarikh;
    string _StartTime;
    string _EndTime;
    int _Type;
    bool _IsStart;
    int _Delay;
    #region properties
    public int srl { get { return _Srl; } set { _Srl = value; } }
    public int Srl_Erae { get { return _Srl_Erae; } set { _Srl_Erae = value; } }
    public string Tarikh { get { return _Tarikh; } set { _Tarikh = value; } }
    public string StartTime { get { return _StartTime; } set { _StartTime = value; } }
    public string EndTime { get { return _EndTime; } set { _EndTime = value; } }
    public int Type { get { return _Type; } set { _Type = value; } }
    public bool IsStart { get { return _IsStart; } set { _IsStart = value; } }
    public int Delay { get { return _Delay; } set { _Delay = value; } }

    #endregion

    #region Insert
    public bool Insert()
    {

        SqlCommand com = new SqlCommand("InsertCAS_Session");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Erae", Srl_Erae);
        com.Parameters.AddWithValue("@Tarikh", Tarikh);
        com.Parameters.AddWithValue("@StartTime", StartTime);
        com.Parameters.AddWithValue("@EndTime", EndTime);
        com.Parameters.AddWithValue("@Type", Type);
        com.Parameters.AddWithValue("@IsStart", IsStart);
        com.Parameters.AddWithValue("@Delay", Delay);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {

        SqlCommand com = new SqlCommand("UpdateCAS_Session");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl_Erae", Srl_Erae);
        com.Parameters.AddWithValue("@Tarikh", Tarikh);
        com.Parameters.AddWithValue("@StartTime", StartTime);
        com.Parameters.AddWithValue("@EndTime", EndTime);
        com.Parameters.AddWithValue("@Type", Type);
        com.Parameters.AddWithValue("@IsStart", IsStart);
        com.Parameters.AddWithValue("@Delay", Delay);
        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public bool Delete(int Srl)
    {

        return PublicFunction.d.Delete("CAS_Session", Srl);
    }
    #endregion

    #region Select
    public static DataRow Select(int Srl)
    {

        DataRow Dr = PublicFunction.d.GetRow("CAS_Session", "Srl=N'" + Srl + "'");
        if (Dr != null)
        {
            return Dr;
        }
        return null;
    }
    #endregion

    public static string InsertSession(int Srl_Erae, string TermStartDate, string TermEndDate, int Type, string Day, string StartTime, string EndTime)
    {
        string[] HolidayList = PublicFunction.GetHolidayData();
        string start = TermStartDate;
        string end = TermEndDate;
        int WeekCounter = 1;
        string query = "";
        DateTime EndDate = VB_Component.DateFuntion.GetDAte(end);
        DateTime StartDate = VB_Component.DateFuntion.GetDAte(start);
        if (StartDate != null && EndDate != null)
        {
            while (StartDate <= EndDate)
            {
                start = VB_Component.FarsiDateFun.E2F(StartDate);
                string TempDay = VB_Component.DateFuntion.GetDeyOfWeek(start);
                // ثابت:2- فرد:1- زوج:0
                if (PublicFunction.GetDayNumberFunction(TempDay) == PublicFunction.GetDayNumber(Day) && (WeekCounter % 2 == Type || Type == 2))
                {
                    StartDate = StartDate.AddDays(Type == 2 ? 6 : 13);
                    if (!(TempDay == "جمعه") && !HolidayList.Contains(start))
                    {
                        try
                        {
                            query += " Insert Into CAS_Session values(" + Srl_Erae.ToString() + ",N'" + start + "',N'" + StartTime + "',N'" + EndTime + "',0,0,0) ";
                            //Session s = new Session();
                            //s.Srl_Erae = Srl_Erae.ToString();
                            //s.Tarikh = start;
                            //s.StartTime = StartTime;
                            //s.EndTime = EndTime;
                            //s.Type = 0;
                            //s.IsStart = false;
                            //s.Delay = 0;
                            //s.Insert();
                        }
                        catch
                        { }

                    }
                }
                if (StartDate.DayOfWeek == DayOfWeek.Friday)
                    WeekCounter++;

                StartDate = StartDate.AddDays(1);

            }

        }
        return query;
    }
    public SessionClass(DataRow Dr)
    {
        if (Dr != null)
        {
            srl = Convert.ToInt32(Dr["Srl"]);
            Srl_Erae = Convert.ToInt32(Dr["Srl_Erae"]);
            Tarikh = Dr["Tarikh"].ToString();
            StartTime = Dr["StartTime"].ToString();
            EndTime = Dr["EndTime"].ToString();
            Type = Convert.ToInt32(Dr["Type"]);
            IsStart = Convert.ToBoolean(Dr["IsStart"]);
            Delay = Convert.ToInt32(Dr["Delay"]);
        }
    }
    public static DataTable GetManageSessionData(string Term)
    {
        DataAccess d = new DataAccess();
        return d.GetDataTable("CAS_Session", " Srl_Term=" + Term);
    }
}