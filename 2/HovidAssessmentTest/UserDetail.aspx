<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="HovidAssessmentTest.UserDetail" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Create User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <form id="form1" runat="server">
        <div class="col-md-3">
            <div class="form-group">
                <asp:Label ID="lblResult" runat="server" Font-Bold="True"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label ID="lblUserId" runat="server" Text="UserID: "></asp:Label>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblUserName" runat="server" Text="UserName: "></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblUserNo" runat="server" Text="UserNo:"></asp:Label>
                <asp:TextBox ID="txtUserNo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning" OnClick="btnUpdate_OnClick" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_OnClick"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
