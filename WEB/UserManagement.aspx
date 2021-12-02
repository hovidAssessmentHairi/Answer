<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="HovidAssessmentTest.UserManagement" %>

<!DOCTYPE html>

<<html lang="en">
<head runat="server">
    <title>Create User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <<asp:Repeater runat="server" ID="tableRepeater">
        <HeaderTemplate>
            <div class="table-responsive-lg">
                <table class="table table-hover table-sm">
                    <thead class="thead-dark">
                        <tr class="text-center">
                            <th scope="col">No</th>
                            <th scope="col">User ID</th>
                            <th scope="col">UserName</th>
                            <th scope="col">UserNo</th>
                            <th scope="col">CreateDate</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tbody>
                <tr class="text-center">
                    <th scope="row">
                        <asp:Label ID="lbl_Id" runat="server" Text='<%# CalculatedItemIndex(Container.ItemIndex) %>'></asp:Label>
                    </th>
                    <td>
                        <asp:LinkButton ID="btnUserDetail" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserID") %>' runat="server" OnClick="btnUserDetail_OnClick"
                                        Text='<%# DataBinder.Eval(Container.DataItem,"UserID") %>' />
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem,"UserNo") %>
                    </td>
                    <td>
                        <%# DataBinder.Eval(Container.DataItem,"CreateDate") %>
                    </td>
                    <td>

                    </td>
                </tr>
            </tbody>
        </ItemTemplate>
        <FooterTemplate>
            </table>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <!--Pagination-->
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <asp:DataList ID="rptPaging" runat="server" 
                OnItemDataBound="rptPaging_ItemDataBound"
                RepeatDirection="Horizontal">
                <ItemTemplate>
                    <li class="page-item">
                        <asp:LinkButton ID="lbPaging" runat="server"
                            CommandArgument='<%# Eval("PageIndex") %>'
                            CommandName="newPage"
                            Text='<%# Eval("PageText") %> ' CssClass="page-link">
                        </asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:DataList>
        </ul>
    </nav>
    </form>
</body>
</html>
