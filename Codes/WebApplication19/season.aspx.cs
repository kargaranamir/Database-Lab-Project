using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication19
{
    public partial class season1 : System.Web.UI.Page
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
            var result = from S in db.seasons
                         select new
                         {
                            S.season_id,
                            S.category,
                            S.date_start,
                            S.date_end


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
                        var goal = new season();
                        goal.season_id = Convert.ToInt32(TextBox1.Text);
                        goal.date_start = Convert.ToDateTime(TextBox3.Text);
                        goal.date_end = Convert.ToDateTime(TextBox3.Text);

                        if (CheckBox1.Checked)
                            goal.category = 'P';
                        else if (CheckBox2.Checked)
                            goal.category = '1';
                        else if (CheckBox3.Checked)
                            goal.category = '2';

                        else if (CheckBox4.Checked)
                           goal.category = '3';
                        db.seasons.InsertOnSubmit(goal);
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
                var goal = (from S in dbCount.seasons
                            where S.season_id == Convert.ToInt32(TextBox1.Text)
                            select S).Single();
                goal.season_id = Convert.ToInt32(TextBox1.Text);
                goal.date_start = Convert.ToDateTime(TextBox3.Text);
                goal.date_end = Convert.ToDateTime(TextBox3.Text);

                if (CheckBox1.Checked)
                    goal.category = 'P';
                else if (CheckBox2.Checked)
                    goal.category = '1';
                else if (CheckBox3.Checked)
                    goal.category = '2';

                else if (CheckBox4.Checked)
                    goal.category = '3';


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
                        var goal = (from c in dbCount.seasons
                                    where c.season_id == Convert.ToInt32(TextBox1.Text)

                                    select c).Single();
                        dbCount.seasons.DeleteOnSubmit(goal);
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
                var result = from S in dbCount.seasons
                             where S.season_id == Convert.ToInt32(TextBox4.Text)
                             select new
                             {
                                 S.season_id,
                                 S.category,
                                 S.date_start,
                                 S.date_end,

                             };


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

        
    
