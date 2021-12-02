using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HovidAssessmentTest
{
    public partial class CreateUser : System.Web.UI.Page
    {
        public Database _db;
        protected void Page_Load(object sender, EventArgs e)
        {
            _db = new Database();
        }

        protected void btnCreate_OnClick(object sender, EventArgs e)
        {
            if (txtUserName.Text == "" || txtUserNo.Text == "")
            {
                lblResult.Text = "Please Fill-in username and userno field";
                lblResult.ForeColor = Color.Red;
                return;
            }

            //check if value userno is interger or not
            bool isNumber = Int32.TryParse(txtUserNo.Text, out int checkUserNo);

            if (!isNumber)
            {
                lblResult.Text = "Please User Number format only for User No";
                lblResult.ForeColor = Color.Red;
                return;
            }

            if (InsertIntoDatabase(txtUserName.Text, txtUserNo.Text))
            {
                lblResult.Text = "User Create Success";
                lblResult.ForeColor = Color.Green;
                return;
            }
        }

        protected void btnReset_OnClick(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtUserNo.Text = "";
            txtUserName.Focus();
        }

        private bool InsertIntoDatabase(string userName, string userNo)
        {
            try
            {
                return _db.ExecuteInsertQuery(userName, userNo);
 
            }
            catch (Exception err)
            {
                Console.WriteLine(err);
                throw err;
            }
        }
    }
}