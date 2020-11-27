using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication19
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        public void BindGridView()
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var result = from S in db.countries
                         select new { S.country_id, S.country_name };

            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        public void ch_()
        {
            string display = "Erorr! this ID for primary key there is or there is as F_K in another table  :(";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);



        }



        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                DataClasses1DataContext dbCount = new DataClasses1DataContext();
                var country1 = (from c in dbCount.countries
                                where c.country_id == Convert.ToInt32(TextBox1.Text)

                                select c).Single();
                dbCount.countries.DeleteOnSubmit(country1);
                dbCount.SubmitChanges();
                BindGridView();
            }
            catch (System.Exception excep)
            {


                ch_();
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                DataClasses1DataContext dbCount = new DataClasses1DataContext();
                var country1 = (from S in dbCount.countries
                                where S.country_id == Convert.ToInt32(TextBox1.Text)
                                select S).Single();

                country1.country_id = Convert.ToInt32(TextBox1.Text);
                country1.country_name = (TextBox2.Text);

                dbCount.SubmitChanges();

                BindGridView();
            }
            catch (System.Exception excep)
            {


                ch_();
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("personal.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("team.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("player.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("player-team.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("coach.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("coach_team.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("referee.aspx");
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Response.Redirect("match.aspx");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Response.Redirect("detailmatch.aspx");
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            Response.Redirect("detailgoal.aspx");
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            Response.Redirect("detailwarning.aspx");
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            Response.Redirect("season.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            {
                try
                {
                    using (DataClasses1DataContext dbCITY = new DataClasses1DataContext())
                    {
                        var count = new country();
                        count.country_id = Convert.ToInt32(TextBox1.Text);
                        count.country_name = TextBox2.Text;

                        dbCITY.countries.InsertOnSubmit(count);

                        dbCITY.SubmitChanges();
                        BindGridView();

                    }
                }


                catch (System.Exception excep)
                {


                    ch_();
                }

            }
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                DataClasses1DataContext dbCount = new DataClasses1DataContext();
                var result = from S in dbCount.countries
                             where S.country_id == Convert.ToInt32(TextBox3.Text)
                             select new { S.country_id, S.country_name };

                GridView1.DataSource = result;
                GridView1.DataBind();
            }
            catch (System.Exception excep)
            {


                ch_();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button20_Click(object sender, EventArgs e)
        {
            Response.Redirect("stadium.aspx");
        }

        protected void Button22_Click(object sender, EventArgs e)
        {

            {
                Response.Redirect("city.aspx");
            }
        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            Response.Redirect("mainpage.aspx");
        }
    }
}