using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HovidAssessmentTest
{
    public partial class UserDetail : System.Web.UI.Page
    {
        public Database _db;

        protected void Page_Load(object sender, EventArgs e)
        {
            string requestedUser = Request.QueryString["Id"].ToString();
            _db = new Database();
            LoadUser(requestedUser);
            
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            if (Update(txtUserID.Text, txtUserName.Text, txtUserNo.Text))
            {
                lblResult.Text = "UPDATE SUCCESS";
            }
        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            if (Delete(txtUserID.Text))
            {
                lblResult.Text = "DELETE SUCCESS";
            }
        }

        private bool Update(string id, string username, string userno)
        {
            return _db.ExecuteUpdateQuery(txtUserID.Text, txtUserName.Text, txtUserNo.Text);
        }

        private bool Delete(string id)
        {
            return _db.ExecuteDeleteQuery(txtUserID.Text);
        }

        private void LoadUser(string id)
        {
            DataTable user = new DataTable();
            
            user = _db.ExecuteSelectQuery(id);

            foreach (DataRow dr in user.Rows)
            {
                txtUserID.Text = dr["UserID"].ToString();
                txtUserName.Text = dr["UserName"].ToString();
                txtUserNo.Text = dr["UserNo"].ToString();
            }
        }
    }
}