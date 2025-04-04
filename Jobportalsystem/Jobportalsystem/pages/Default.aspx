<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Jobportalsystem.pages.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home-Job Portal</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- bootstrap navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx"> Job Portal</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data--bs-targer="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Register.aspx">Register</a></li>
                        <li class="nave-item"><a class="nav-link" href="Login.aspx">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- main banner -->
        <div class="container text-center mt-5">
            <h1>Welcome to the online job portal</h1>
            <p class="lead">Find your dream job today.</p>
            <a href="Register.aspx" class="btn btn-primary btn-lg">Get started</a>
        </div>
    </form>
</body>
</html>
