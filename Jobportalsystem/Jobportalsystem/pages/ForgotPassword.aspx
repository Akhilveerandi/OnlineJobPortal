<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Jobportalsystem.pages.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>

    <!-- bootstrap for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center">Forgot Password</h2>
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label">Enter Your Email</label>
                    <input type="email" class="form-control" id="txtEmail" required="required" />
                </div>
                <div class="mb-3">
                    <button id="btnResetPassword" class="btn btn-primary">send reset link</button>
                </div>
                <p id="message" class="text-center"></p> <!-- success/error message -->
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $('#btnResetPassword').click(function (e) {
                e.preventDefault();   // prevent from refreshing

                // get user input values
                var email = $('#txtEmail').val();
                

                // send data to server using asax
                $.ajax({
                    type: "POST"
                    URL: "ForgotPasswordHandler.aspx",  // call a seperate handler page
                    data: { Email: email, },
                    success: function (response) {
                        $("#message").text(response).css("color", "green");
                    },
                    error: fuction() {
                        $("#message").text("Error sending reset link.").css("color", "red");
                    }
                });
            });
        });
    </script>
    <!-- this is a test comment to chedk git change d -->
</body>
</html>
