<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebFacturacion3.View.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Content/bootstrap.min.css" />
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/fonts/fontawesome-all.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login - Facturación | 07IDVA</title>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background-image: url(/content/assets/img/login.jpg);"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Bienvenido</h4>
                                    </div>
                                    <form id="form1" class="user" runat="server">
                                        <div class="form-group"><asp:TextBox class="form-control form-control-user" type="email" id="txtemail" runat="server" aria-describedby="emailHelp" placeholder="Usuario" name="email"></asp:TextBox></div>
                                        <div class="form-group"><asp:TextBox class="form-control form-control-user" id="txtPass" name="password" runat="server"  MinLength="5" MaxLength="100" placeholder="Contraseña" type="password"></asp:TextBox></div><asp:LinkButton runat="server" class="btn btn-primary btn-block text-white btn-user" type="submit">Iniciar Sesión</asp:LinkButton>                                        
                                        <hr/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
