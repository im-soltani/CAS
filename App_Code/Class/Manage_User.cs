using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// Summary description for Manage_User
/// </summary>
public class Manage_User
{
    public Manage_User()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    int _Srl;
    string _UserName;
    string _PassWord;
    int _Srl_User;
    int _Srl_Role;
    bool _IsActive;

    #region properties

    public int srl { get { return _Srl; } set { _Srl = value; } }
    public string UserName { get { return _UserName; } set { _UserName = value; } }
    public string PassWord { get { return _PassWord; } set { _PassWord = value; } }
    public int Srl_User { get { return _Srl_User; } set { _Srl_User = value; } }
    public int Srl_Role { get { return _Srl_Role; } set { _Srl_Role = value; } }
    public bool IsActive { get { return _IsActive; } set { _IsActive = value; } }

    #endregion

    #region Insert
    public bool Insert()
    {
        
        SqlCommand com = new SqlCommand("InsertCAS_User");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@UserName", UserName);
        com.Parameters.AddWithValue("@PassWord", PassWord);
        com.Parameters.AddWithValue("@Srl_User", Srl_User);
        com.Parameters.AddWithValue("@Srl_Role", Srl_Role);
        com.Parameters.AddWithValue("@IsActivity", IsActive);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Update
    public bool Update()
    {
        
        SqlCommand com = new SqlCommand("UpdateCAS_User");
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Srl", srl);
        com.Parameters.AddWithValue("@UserName", UserName);
        com.Parameters.AddWithValue("@PassWord", PassWord);
        com.Parameters.AddWithValue("@Srl_User", Srl_User);
        com.Parameters.AddWithValue("@Srl_Role", Srl_Role);
        com.Parameters.AddWithValue("@IsActivity", IsActive);

        return PublicFunction.d.ExecQuery(com);
    }
    #endregion

    #region Delete
    public static bool Delete(int Srl)
    {
        
        return PublicFunction.d.Delete("CAS_User", Srl);
    }
    #endregion
 
    public static DataRow IsValidUser(string username, string password)
    {

        
        DataRow Dr = PublicFunction.d.GetRow("Cas_User", "UserName=N'" + username + "'");
        if (Dr != null)
        {
            //if (Dr["Password"].ToString() == HashSHA1(password))
            //{
            ///////////////?????
            return Dr;
            //}
            //else
            //    return null;
        }
        return null;
    }
   
    //public Manage_User(DataRow Dr)
    //{
    //    if (Dr != null)
    //    {
    //        srl = Convert.ToInt32(Dr["srl"]);
    //        UserName = Dr["UserName"].ToString();
    //        Srl_User = Convert.ToInt32(Dr["Srl_User"]);
    //        PassWord = Dr["PassWord"].ToString();
    //        IsActive = Dr["IsActive"].ToString();
    //    }
    //}
    public static string HashSHA1(string value)
    {
        var sha1 = System.Security.Cryptography.SHA1.Create();
        var inputBytes = Encoding.ASCII.GetBytes(value);
        var hash = sha1.ComputeHash(inputBytes);
        var sb = new StringBuilder();
        for (var i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString();
    }

}