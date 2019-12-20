using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace SE_lab.images
{
    public partial class add_Student : System.Web.UI.Page
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
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn_Sadd_Click(object sender, EventArgs e)
        {
            string command = "INSERT INTO Student(FirstName,LastName,RegNo,Email) VALUES(@FirstName,@LastName,@RegNo,@Email)";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@FirstName", txt_SFristName.Text);
            cmd.Parameters.AddWithValue("@LastName", txt_SLastName.Text);
            cmd.Parameters.AddWithValue("@RegNo", txt_RegistraitonNo.Text);
            cmd.Parameters.AddWithValue("@Email", txt_Semail.Text);
            SqlCommand cmd1 = new SqlCommand("select ID as userid from Student where RegNo='" + txt_RegistraitonNo.Text + "'", conn);
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
                string script1 = "alert(\"Student Already Exists\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script1, true);

            }
            else
            {
                cmd.ExecuteNonQuery();
                string script = "alert(\"Student Added Successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            display_data();
            txt_SFristName.Text = " ";
            txt_SLastName.Text = " ";
            txt_RegistraitonNo.Text = " ";
            txt_Semail.Text = " ";
        }

        public void display_data()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Student";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            std_data.DataSource = dt;
            std_data.DataBind();
        }

        protected void btn_Supdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update_student.aspx");
        }
    }
}