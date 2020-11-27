using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication19
{
    public partial class Team : System.Web.UI.Page
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
            var result = from S in db.teams
                         select new { S.city_id, S.team_id, S.team_name };
            GridView1.DataSource = result;
            GridView1.DataBind();
        
    }
        public void ch_()
        {
            string display = "Erorr! this ID for primary key there is or there is as F_K in another table  :(";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);



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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("mainpage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("country.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            {
                using (DataClasses1DataContext dbCount = new DataClasses1DataContext())
                {
                    try
                    {
                        var country1 = (from c in dbCount.teams
                                        where c.team_id == Convert.ToInt32(TextBox1.Text)

                                        select c).Single();
                        dbCount.teams.DeleteOnSubmit(country1);
                        dbCount.SubmitChanges();

                    }

                    catch (System.Exception excep)

                    {
                        ch_();
                    }


                }
            }
            BindGridView();
        }

        protected void Button20_Click(object sender, EventArgs e)
        {
            Response.Redirect("stadium.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("personal.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

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

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            {
                using (DataClasses1DataContext dbCITY = new DataClasses1DataContext())
                {
                    try
                    {
                        var count = new team();
                        count.team_id = Convert.ToInt32(TextBox1.Text);
                        count.team_name = TextBox3.Text;
                        count.city_id = Convert.ToInt32(TextBox2.Text);

                        dbCITY.teams.InsertOnSubmit(count);

                        dbCITY.SubmitChanges();
                        BindGridView();

                    }
                    catch (System.Exception excep)

                    {

                        ch_();

                    }


                }

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext dbCount = new DataClasses1DataContext();
            try
            {
                var count = (from S in dbCount.teams
                             where S.team_id == Convert.ToInt32(TextBox1.Text)
                             select S).Single();

                count.team_id = Convert.ToInt32(TextBox1.Text);
                count.team_name = TextBox3.Text;
                count.city_id = Convert.ToInt32(TextBox2.Text);

                dbCount.SubmitChanges();

                BindGridView();
            }
            catch (System.Exception excep)

            {

                ch_();

            }
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                DataClasses1DataContext dbCount = new DataClasses1DataContext();
                var result = from S in dbCount.teams
                             where S.team_id == Convert.ToInt32(TextBox4.Text)
                             select new { S.city_id,S.team_id,S.team_name };

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

        protected void Button22_Click(object sender, EventArgs e)
        {
            Response.Redirect("city.aspx");
        }
    }
}