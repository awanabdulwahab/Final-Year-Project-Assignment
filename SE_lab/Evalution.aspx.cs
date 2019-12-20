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
    public partial class Evalution : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(conn.State== ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
            display_data();
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string command = "INSERT INTO tb_Evaluation(GroupName,TotalMarks,ObtainedMarks,Date) VALUES(@GroupName,@TotalMarks,@ObtainedMarks,@Date)";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@GroupName", Select_Group.Text);
            cmd.Parameters.AddWithValue("@TotalMarks", txt_totalMarks.Text);
            cmd.Parameters.AddWithValue("@ObtainedMarks", txt_ObtainedMarks.Text);
            cmd.Parameters.AddWithValue("@Date", Calendar1.SelectedDate);
            
            cmd.ExecuteNonQuery();
            string script = "alert(\"Evaluation Taken Successfully\");";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            display_data();
            Select_Group.ClearSelection();
            txt_ObtainedMarks.Text = "";
            txt_totalMarks.Text = "";
        }
        public void display_data()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tb_Evaluation";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            display_Evalution.DataSource = dt;
            display_Evalution.DataBind();
        }
    }
}