<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Jobportalsystem.pages.AdmiDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AdminDashboard</title>
    <link rel="stylesheet"  type="text/css"/ href="../Style.css">
</head>
<body>
    <form id="form1" runat="server">
        <h2>Manage Job Listings</h2>
        <div>
            <asp:GridView ID="gvAdminJobs" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Job Title" />
                    <asp:BoundField DataField="Company" HeaderText="Company" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="PostedAt" HeaderText="PostedAt Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <!-- admin can delete the job -->
                            <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("JobID") %>' Text="Delete" OnClick="btnDelete_Click"/>
                        </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
