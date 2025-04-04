<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="Jobportalsystem.pages.PostJob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post a New Job</title>
    <link rel="stylesheet" type="text/css" href="../Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Post a New Job</h2>
        <div>
            <label>Job Title: </label>
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox><br />

            <label>Company: </label>
            <asp:TextBox ID="txtcompany" runat="server"></asp:TextBox><br />

            <label>Location: </label>
            <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox><br />

            <label>Description: </label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox><br />

            <label>Salary: </label>
            <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox><br />

            <asp:Button ID="btnPostJob" runat="server" Text="Post Job" OnClick="btnPostJob_Click"/>
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

        </div>
    </form>
</body>
</html>
