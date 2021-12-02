using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HovidAssessmentTest
{
    public partial class UserManagement : System.Web.UI.Page
    {
        public Database _db;
        protected void Page_Load(object sender, EventArgs e)
        {
            _db = new Database();
            BindData();
        }

        #region Pagination
        private readonly PagedDataSource _pgsource = new PagedDataSource();
        private int _firstIndex, _lastIndex;
        private int _pageSize = 5;
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        #endregion

        #region Bind Data

        private void BindData()
        {
            tableRepeater.DataSource = null;

            var dt = _db.ExecuteSelectQuery();
            _pgsource.DataSource = dt.DefaultView;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"

            // Bind data into repeater
            tableRepeater.DataSource = _pgsource;
            tableRepeater.DataBind();

            // Call the function to do paging
            HandlePaging();
        }
        #endregion

        #region UI: Paging

        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 10;
            if (CurrentPage > 10)
                _lastIndex = CurrentPage + 10;
            else
                _lastIndex = 20;

            // Check last page is greater than total page then reduced it
            // to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 20;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = Color.WhiteSmoke;
        }

        public string CalculatedItemIndex(object itemindex)
        {
            return ((_pgsource.PageSize * _pgsource.CurrentPageIndex) + Convert.ToInt32(itemindex) + 1).ToString();
        }

        #endregion

        protected void btnUserDetail_OnClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string userid = btn.Text;

            Response.Redirect("UserDetail.aspx?Id=" + userid);
        }
    }
}