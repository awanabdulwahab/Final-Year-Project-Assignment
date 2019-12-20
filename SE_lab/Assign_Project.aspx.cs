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
    public partial class Assign_Project : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string studentSelected = " ";
            string AdvisorSelected = " ";
            string projectSelected = " ";
            for(int i=0; i<Select_Group.Items.Count; i++)
            {
                if (Select_Group.Items[i].Selected)
                {
                    if(studentSelected== "")
                    {
                        studentSelected = Select_Group.Items[i].Text;
                    }
                    else
                    {
                        studentSelected += Select_Group.Items[i].Text;
                    }
                }
            }
            for(int i=0; i<Select_Advisor.Items.Count; i++)
            {
                if (Select_Advisor.Items[i].Selected)
                {
                    if(AdvisorSelected== "")
                    {
                        AdvisorSelected = Select_Advisor.Items[i].Text;
                    }
                    else
                    {
                        AdvisorSelected += Select_Advisor.Items[i].Text + " ";
                    }
                }
            }
            for (int i = 0; i < Select_Project.Items.Count; i++)
            {
                if (Select_Project.Items[i].Selected)
                {
                    if (projectSelected == "")
                    {
                        projectSelected = Select_Project.Items[i].Text;
                    }
                    else
                    {
                        projectSelected +=  Select_Project.Items[i].Text + " ";
                    }
                }
            }
            string command = "INSERT INTO AssginedProjects(GroupName,AdvisorName,ProjectName) VALUES(@GroupName,@AdvisorName,@ProjectName)";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@GroupName", studentSelected);
            cmd.Parameters.AddWithValue("@AdvisorName", AdvisorSelected);
            cmd.Parameters.AddWithValue("@ProjectName", projectSelected);
            SqlCommand cmd1 = new SqlCommand("select ID as userid from AssginedProjects where GroupName='" + studentSelected + "'", conn);
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
                string script1 = "alert(\"Group Already Have a Assigned Project\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script1, true);

            }
            else
            {
                cmd.ExecuteNonQuery();
                string script = "alert(\"Project Assigned Successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            display_data();
            studentSelected = "";
            AdvisorSelected= "";
            projectSelected = "";
        }
        public void display_data()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from AssginedProjects";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Data_View.DataSource = dt;
            Data_View.DataBind();
        }
    }
}