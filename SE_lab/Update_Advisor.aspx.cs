using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace SE_lab
{
    public partial class Update_Advisor : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt = new DataTable();
        DataRow drow;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd1 = new SqlCommand("select ID as userid from Advisor where Email='" + txt_email.Text + "'", conn);
            SqlDataReader dr;
            dr = cmd1.ExecuteReader();
            if (!dr.Read())
            {
                string script1 = "alert(\"Advisor Not Found\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script1, true);
            }
            else
            {
                dr.Close();
                da = new SqlDataAdapter("select* from Advisor where Email='" + txt_email.Text + "'", conn);
                da.Fill(dt);
                drow = dt.Rows[0];
                txt_FirstName.Text = (string)drow[1].ToString();
                txt_LastName.Text = (string)drow[2].ToString();
                txt_Rank.Text = (string)drow[3].ToString();
                txt_EmailAddress.Text = (string)drow[4].ToString();
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            string command = "Update Advisor set [FirstName]=@FirstName,[LastName]=@LastName,[Rank]=@Rank,[Email]=@Email where Email='" + txt_email.Text + "'";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@FirstName", txt_FirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txt_LastName.Text);
            cmd.Parameters.AddWithValue("@Rank", txt_Rank.Text);
            cmd.Parameters.AddWithValue("@Email", txt_EmailAddress.Text);
            cmd.ExecuteNonQuery();
            string script = "alert(\"Advisor Updated Successfully\");";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            display_data();
            txt_FirstName.Text = " ";
            txt_LastName.Text = " ";
            txt_Rank.Text = " ";
            txt_EmailAddress.Text = " ";
        }
        public void display_data()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Advisor";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            display_Advisor.DataSource = dt;
            display_Advisor.DataBind();
        }
    }
}