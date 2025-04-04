<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Jobportalsystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Job Portal</title>

    <!-- bootstrap for styling-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <!-- jquery for ajax-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#btnLogin').click(function (e) {
                e.preventDefault();   // prevent from refreshing

                // get user input values
                var email = $('#txtEmail').val();
                var password = $('txtPassword').val();

                // send data to server using asax
                $.ajax({
                    type: "POST"
                    URL: "LoginHandler.aspx",  // call a seperate handler page
                    data: { Email: email, Password: password },
                    success: function (response) {
                        if (response == "success") {
                            window.location.href = "Dashboard.aspx"; // redirect to dashboard
                        }
                        else {
                            $("#errorMessage").text("Invalid Emal or Password").css("color", "red");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">Login</h2>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Email:</label>
                        <input type="email" class="form-control" id="txtEmail" runat="server" required="required" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password:</label>
                        <input type="password" class="form-control" id="txtPassword" runat="server" required="required" />
                    </div>
                    <div class="mb-3 text-center">
                        <asp:Button ID="btnLogin" runat="server"  Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click"/>
                    </div>
                    <p id="erroMessage" class="text-center"></p>   <!-- Error Message-->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
