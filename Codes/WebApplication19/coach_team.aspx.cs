using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication19
{
    public partial class coach_team : System.Web.UI.Page
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
            var result = from f in db.coaches
                         join S in db.team_coaches on f.coach_id equals S.id_coach
                         join p in db.teams on S.id_team equals p.team_id
                         select new
                         {
                             S.id_coach,
                             f.coach_name,
                             f.coach_lastname,
                             S.id_team,
                             p.team_name,
                             S.id_season,
                             S.amount_



                         };

            GridView2.DataSource = result;
            GridView2.DataBind();

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

        protected void Button22_Click(object sender, EventArgs e)
        {
            Response.Redirect("city.aspx");
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

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            {
                using (DataClasses1DataContext db = new DataClasses1DataContext())
                {
                    try
                    {
                        var goal = new team_coach();
                        goal.id_season = Convert.ToInt32(TextBox1.Text);
                        goal.id_coach = Convert.ToInt32(TextBox2.Text);
                        goal.id_team = Convert.ToInt32(TextBox3.Text);
                        goal.amount_ = Convert.ToInt32(TextBox5.Text);

                        db.team_coaches.InsertOnSubmit(goal);
                        db.SubmitChanges();

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
                var goal = (from S in dbCount.team_coaches
                            where S.id_season == Convert.ToInt32(TextBox1.Text) && S.id_coach == Convert.ToInt32(TextBox2.Text)
             && S.id_team == Convert.ToInt32(TextBox3.Text)
                            select S).Single();

                goal.id_season = Convert.ToInt32(TextBox1.Text);
                goal.id_coach = Convert.ToInt32(TextBox2.Text);
                goal.id_team = Convert.ToInt32(TextBox3.Text);
                goal.amount_ = Convert.ToInt32(TextBox5.Text);
                dbCount.SubmitChanges();

                BindGridView();
            }
            catch (System.Exception excep)

            {

                ch_();

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            {
                using (DataClasses1DataContext dbCount = new DataClasses1DataContext())
                {
                    try
                    {
                        var goal = (from S in dbCount.team_coaches
                                    where S.id_season == Convert.ToInt32(TextBox1.Text) && S.id_coach == Convert.ToInt32(TextBox2.Text)
                     && S.id_team == Convert.ToInt32(TextBox3.Text)

                                    select S).Single();
                        dbCount.team_coaches.DeleteOnSubmit(goal);
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


        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            DataClasses1DataContext dbCount = new DataClasses1DataContext();
            try
            {
                if (CheckBox7.Checked)
                {
                    var result = from S in dbCount.teams
                                 where
                                   S.team_name == (TextBox4.Text)
                                 select new
                                 {
                                     S.team_id,
                                     S.team_name,



                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                else if (CheckBox8.Checked)
                {
                    var result = from S in dbCount.coaches
                                 where
                                  S.coach_name == (TextBox4.Text)
                                 select new
                                 {
                                     S.coach_id,
                                     S.coach_name,
                                     S.coach_lastname,


                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                else if (CheckBox11.Checked)
                {
                    var result = from S in dbCount.teams
                                 where
                                   S.team_id == Convert.ToInt32(TextBox4.Text)
                                 select new
                                 {
                                     S.team_id,
                                     S.team_name,



                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                else if (CheckBox9.Checked)
                {
                    var result = from S in dbCount.coaches
                                 where
                                  S.coach_id == Convert.ToInt32(TextBox4.Text)
                                 select new
                                 {
                                     S.coach_id,
                                     S.coach_name,
                                     S.coach_lastname,


                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }




            }
            catch (System.Exception excep)

            {

                ch_();


            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox10_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox6_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void CheckBox2_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void CheckBox3_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void CheckBox4_CheckedChanged1(object sender, EventArgs e)
        {

        }
    }









}

   
        
    
