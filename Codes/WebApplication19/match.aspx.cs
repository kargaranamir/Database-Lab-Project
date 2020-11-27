using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication19
{
    public partial class match1 : System.Web.UI.Page
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
            var result = from S in db.matches 
                         select new
                         {S.season,
                             S.match_id,
                             S.stadium_id,
                             S.team1_id,
                             S.team2_id,
                             S.stage,
                             S.match_date,
                             S.id_referee,
                             S.id_assist_referee1,
                             S.id_assist_referee2

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
                        var match = new match();
                        match.match_id = Convert.ToInt32(TextBox1.Text);
                        match.stadium_id = Convert.ToInt32(TextBox2.Text);
                        match.team1_id = Convert.ToInt32(TextBox3.Text);
                        match.team2_id = Convert.ToInt32(TextBox5.Text);
                        match.season_id = Convert.ToInt32(TextBox6.Text);
                        match.match_date = Convert.ToDateTime(TextBox7.Text);
                        match.id_referee= Convert.ToInt32(TextBox8.Text);
                        match.id_assist_referee1 = Convert.ToInt32(TextBox9.Text);
                        match.id_assist_referee2 = Convert.ToInt32(TextBox10.Text);
                        if (CheckBox1.Checked)
                            match.stage = 'G';
                        else if (CheckBox2.Checked)
                            match.stage = 'R';
                        else if (CheckBox3.Checked)
                            match.stage = 'Q';

                        else if (CheckBox4.Checked)
                            match.stage = 'F';

                        db.matches.InsertOnSubmit(match);
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
                var match = (from S in dbCount.matches
                             where S.match_id == Convert.ToInt32(TextBox1.Text)
                             select S).Single();

                match.match_id = Convert.ToInt32(TextBox1.Text);
                match.stadium_id = Convert.ToInt32(TextBox2.Text);
                match.team1_id = Convert.ToInt32(TextBox3.Text);
                match.team2_id = Convert.ToInt32(TextBox5.Text);
                match.season_id = Convert.ToInt32(TextBox6.Text);
                match.match_date = Convert.ToDateTime(TextBox7.Text);
                match.id_referee = Convert.ToInt32(TextBox8.Text);
                match.id_assist_referee1 = Convert.ToInt32(TextBox9.Text);
                match.id_assist_referee2= Convert.ToInt32(TextBox10.Text);
                if (CheckBox1.Checked)
                    match.stage = 'G';
                else if (CheckBox2.Checked)
                    match.stage = 'R';
                else if (CheckBox3.Checked)
                    match.stage = 'Q';

                else if (CheckBox4.Checked)
                    match.stage = 'F';

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
                        var match = (from c in dbCount.matches
                                     where c.match_id == Convert.ToInt32(TextBox1.Text)

                                     select c).Single();
                        dbCount.matches.DeleteOnSubmit(match);
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
                                 where S.team_name == TextBox4.Text
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
                    var result = from S in dbCount.Stadiums
                                 join c in dbCount.cities on S.city_id equals c.city_id
                                 where S.Stadium_name == TextBox4.Text
                                 select new
                                 {
                                     S.Stadium_id,
                                     S.Stadium_name,
                                     c.city_name,
                                     S.capacity
                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
                if (CheckBox9.Checked)
                {
                    var result = from S in dbCount.matches
                                 where S.match_id == Convert.ToInt32(TextBox4.Text)
                                 select new
                                 {
                                     S.season,
                                     S.match_id,
                                     S.stadium_id,
                                     S.team1_id,
                                     S.team2_id,
                                     S.stage,
                                     S.match_date,
                                     S.id_referee,
                                     S.id_assist_referee1,
                                     S.id_assist_referee2
                                 };


                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }

            
if (CheckBox10.Checked)
            {
                var result = from S in dbCount.referees
                             where S.referee_id == Convert.ToInt32(TextBox4.Text) && S.reffree_or_asstreferee==1
                             select new
                             {
                                 S.referee_id,
                                 S.referee_name,
                                 S.referee_lastname,
                                 S.referee_level
                             };


                GridView1.DataSource = result;
                GridView1.DataBind();
            }
                if (CheckBox11.Checked)
                {
                    var result = from S in dbCount.referees
                                 where S.referee_id == Convert.ToInt32(TextBox4.Text) && S.reffree_or_asstreferee == 2
                                 select new
                                 {
                                     S.referee_id,
                                     S.referee_name,
                                     S.referee_lastname,
                                     S.referee_level
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
    }
}