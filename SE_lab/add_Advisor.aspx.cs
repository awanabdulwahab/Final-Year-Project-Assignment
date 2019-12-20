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
    public partial class add_Advisor : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();

            }
            conn.Open();
            display_data();
        }

        protected void btn_Add_Advisor_Click(object sender, EventArgs e)
        {
            string command = "INSERT INTO Advisor(FirstName,LastName,Rank,Email) VALUES(@FirstName,@LastName,@RegNo,@Email)";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@FirstName", txt_FristName.Text);
            cmd.Parameters.AddWithValue("@LastName", txt_LastName.Text);
            cmd.Parameters.AddWithValue("@RegNo", txt_Rank.Text);
            cmd.Parameters.AddWithValue("@Email", txt_email.Text);
            SqlCommand cmd1 = new SqlCommand("select ID as userid from Advisor where Rank='" + txt_Rank.Text + "'", conn);
            SqlDataReader dr;
            dr = cmd1.ExecuteReader();
            int count = 0;
            while (dr.Read())
            {
                count += 1;
            }
            dr.Close();
            if (count >= 1)
            {
                string script1 = "alert(\"Advisor Already Exists\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script1, true);
            }
            else
            {
                cmd.ExecuteNonQuery();
                string script = "alert(\"Advisor Added Successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            display_data();
            txt_FristName.Text = " ";
            txt_LastName.Text = " ";
            txt_Rank.Text = " ";
            txt_email.Text = " ";
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
            Advisor_data.DataSource = dt;
            Advisor_data.DataBind();
        }

        protected void btn_Supdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update_Advisor.aspx");
        }
    }
}
