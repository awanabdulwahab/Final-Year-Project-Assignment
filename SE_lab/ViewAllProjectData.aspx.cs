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
    public partial class ViewAllProjectData : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
           if(conn.State== ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
        }

        protected void btn_Data_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from AssginedProjects";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Grid_Data.DataSource = dt;
            Grid_Data.DataBind();
        }
    }
}