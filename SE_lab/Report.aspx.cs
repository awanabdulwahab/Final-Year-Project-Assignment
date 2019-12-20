using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.Data.SqlClient;
using System.Data;


namespace SE_lab
{
    public partial class Report : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=SEProject;Integrated Security=True");
        private Document pdfdocument;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(conn.State== ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
            display_data();
        }

        protected void btn_Report_Click(object sender, EventArgs e)
        {
            PdfPTable tbl = new PdfPTable(display_Evalution.HeaderRow.Cells.Count);

            foreach (TableCell tableCell in display_Evalution.HeaderRow.Cells)
            {
                PdfPCell pdf = new PdfPCell(new iTextSharp.text.Phrase(tableCell.Text));
                tbl.AddCell(pdf);
            }

            foreach (GridViewRow gridView in display_Evalution.Rows)
            {
                foreach (TableCell tablecell in gridView.Cells)
                {
                    PdfPCell cell = new PdfPCell(new iTextSharp.text.Phrase(tablecell.Text));
                    tbl.AddCell(cell);
                }
            }
            pdfdocument = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            PdfWriter.GetInstance(pdfdocument, Response.OutputStream);
            pdfdocument.Open();
            pdfdocument.Add(tbl);
            pdfdocument.Close();

            Response.ContentType = "application /pdf";
            Response.AppendHeader("content-disposition", "attachment;filename = Report.pdf");
            Response.Write(pdfdocument);
            Response.Flush();
            Response.End();
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