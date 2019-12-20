using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SE_lab
{
    public partial class add_group : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (conn.State== ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
            display_data();
        }
        static string str =" " ;
        protected void btn_addMember_Click(object sender, EventArgs e)
        {
            int index = Assign_Group.SelectedIndex;
            Response.Write(index);
            if (str == "")
            {
                str = Assign_Group.SelectedValue.ToString();
            }
            else
            {
                str +=  Assign_Group.SelectedValue.ToString() + ' ';
            }
            Assign_Group.Items.RemoveAt(index);
            Assign_Group.ClearSelection();
        }

        protected void btn_FormGroup_Click(object sender, EventArgs e)
        {
            string command = "INSERT INTO GroupFromation(GroupName,GroupMembers) VALUES(@GroupName,@GroupMembers)";
            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.Parameters.AddWithValue("@GroupName", txt_GroupName.Text);
            cmd.Parameters.AddWithValue("@GroupMembers", str);
            SqlCommand cmd1 = new SqlCommand("select ID as userid from GroupFromation where GroupName='" + txt_GroupName.Text + "'", conn);
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
                string script1 = "alert(\"Group Already Exists\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script1, true);

            }
            else
            {
                cmd.ExecuteNonQuery();
                string script = "alert(\"Group Form Successfully\");";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            }
            display_data();
            txt_GroupName.Text = " ";
            str = " ";
        }
        public void display_data()
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from GroupFromation";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Group_Formation.DataSource = dt;
            Group_Formation.DataBind();
        }
    }
}
