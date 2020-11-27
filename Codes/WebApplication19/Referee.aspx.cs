using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication19
{
    public partial class Referee : System.Web.UI.Page
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
            var result = from S in db.referees
                         select new
                         {
                             S.city_id,
                             S.referee_id,
                             S.referee_name,
                             S.referee_lastname,
                             S.referee_level,
                             S.BirthYear,
                             S.reffree_or_asstreferee,
                             S.date_start_referee,
                             S.email
                         };

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
            Response.Redirect("coach_team.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {

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
                        var coach = new referee();
                        coach.referee_id = Convert.ToInt32(TextBox1.Text);
                        coach.referee_name = TextBox3.Text;
                        coach.referee_lastname = TextBox5.Text;
                        coach.city_id = Convert.ToInt32(TextBox2.Text);
                        coach.BirthYear = Convert.ToInt32(TextBox6.Text);
                        coach.email = TextBox7.Text;
                        coach.date_start_referee = Convert.ToDateTime(TextBox8.Text);
                        if (CheckBox1.Checked)
                            coach.referee_level = 1;
                        else if (CheckBox2.Checked)
                            coach.referee_level = 2;
                        else if (CheckBox3.Checked)
                            coach.referee_level = 3;

                        else if (CheckBox4.Checked)
                            coach.referee_level = 4;

                        if (CheckBox5.Checked)
                            coach.reffree_or_asstreferee = 1;
                        else if (CheckBox6.Checked)
                            coach.reffree_or_asstreferee = 2;

                        db.referees.InsertOnSubmit(coach);
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
                var coach = (from S in dbCount.referees
                             where S.referee_id == Convert.ToInt32(TextBox1.Text)
                             select S).Single();

                coach.referee_id = Convert.ToInt32(TextBox1.Text);
                coach.referee_name = TextBox3.Text;
                coach.referee_lastname = TextBox5.Text;
                coach.city_id = Convert.ToInt32(TextBox2.Text);
                coach.BirthYear = Convert.ToInt32(TextBox6.Text);
                coach.email = TextBox7.Text;
                coach.date_start_referee = Convert.ToDateTime(TextBox8.Text);
                if (CheckBox1.Checked)
                    coach.referee_level = 1;
                else if (CheckBox2.Checked)
                    coach.referee_level = 2;
                else if (CheckBox3.Checked)
                    coach.referee_level = 3;

                else if (CheckBox4.Checked)
                    coach.referee_level = 4;

                if (CheckBox5.Checked)
                    coach.reffree_or_asstreferee = 1;
                else if (CheckBox6.Checked)
                    coach.reffree_or_asstreferee = 2;
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
                        var coach = (from c in dbCount.referees
                                     where c.referee_id == Convert.ToInt32(TextBox1.Text)

                                     select c).Single();
                        dbCount.referees.DeleteOnSubmit(coach);
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
                if (CheckBox8.Checked)
                {
                    var result = from S in dbCount.referees
                                 where S.referee_name == TextBox4.Text
                                 select new
                                 {
                                     S.city_id,
                                     S.referee_id,
                                     S.referee_name,
                                     S.referee_lastname,
                                     S.referee_level,
                                     S.BirthYear,
                                     S.reffree_or_asstreferee,
                                     S.date_start_referee,
                                     S.email
                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                else if (CheckBox9.Checked)
                {
                    var result = from S in dbCount.referees
                                 where S.referee_lastname == TextBox4.Text
                                 select new
                                 {
                                     S.city_id,
                                     S.referee_id,
                                     S.referee_name,
                                     S.referee_lastname,
                                     S.referee_level,
                                     S.BirthYear,
                                     S.reffree_or_asstreferee,
                                     S.date_start_referee,
                                     S.email
                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                if (CheckBox7.Checked)
                {
                    var result = from S in dbCount.referees
                                 where S.referee_id == Convert.ToInt32(TextBox4.Text)
                                 select new
                                 {
                                     S.city_id,
                                     S.referee_id,
                                     S.referee_name,
                                     S.referee_lastname,
                                     S.referee_level,
                                     S.BirthYear,
                                     S.reffree_or_asstreferee,
                                     S.date_start_referee,
                                     S.email
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
    }
}