<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Jobportalsystem.UserDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">Welcome to your Dashboard</h2>
            <div class="card mt-4">
                <div class="card-body">
                    <h4 class="text-center">Hello,<asp:Literal ID="liUserName" runat="server"></asp:Literal></h4>
                    <p class="text-center">Your email: <asp:Literal ID="litUserEmail" runat="server"></asp:Literal></p>
                </div>
            </div>
            <div class="text-center mt-3">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger" OnClick="btnLogout_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
