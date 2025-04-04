<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Jobportalsystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - Job Portal</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">Register</h2>
            <div class="row justify-content-center">
                <div class="col-mid-6">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="txtFullName" runat="server" required="required"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" id="txtEmail" runat="server" required="required"/>
                    </div>
                    <div>
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" id="txtPassword" runat="server" required="required" />
                    </div>
                    <div class="mb-3 text-center">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
