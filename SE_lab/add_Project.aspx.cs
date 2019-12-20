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
    public partial class add_Project : System.Web.UI.Page
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

        protected void btn_addProject_Click(object sender, EventArgs e)
        {
            string command = "INSERT INTO AddProject(ProjectName,ProjectDiscription) VALUES(@ProjectName,@ProjectDiscription)";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@ProjectName", txt_ProjectName.Text);
            cmd.Parameters.AddWithValue("@ProjectDiscription", txt_ProjectDescription.Text);
            SqlCommand cmd1 = new SqlCommand("select ID as userid from AddProject where ProjectName='" + txt_ProjectName.Text + "'", conn);
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
                string script1 = "alert(\"Project Already Exists\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script1, true);

            }
            else
            {
                cmd.ExecuteNonQuery();
                string script = "alert(\"Project Added Successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            display_data();
            txt_ProjectName.Text = " ";
            txt_ProjectDescription.Text = " ";
        }
        public void display_data()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from AddProject";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            projectData.DataSource = dt;
            projectData.DataBind();
        }
    }
}