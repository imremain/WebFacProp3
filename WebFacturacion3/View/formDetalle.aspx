﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formDetalle.aspx.cs" Inherits="WebFacturacion3.View.fromDetalle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Content/bootstrap.min.css" />
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/fonts/fontawesome-all.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Detalle Factura</title>
</head>
<body id="page-top">
    <div id="wrapper">
            <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
                <div class="container-fluid d-flex flex-column p-0">
                    <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                        <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-file-invoice"></i></div>
                        <div class="sidebar-brand-text mx-3"><span>Facturación</span></div>
                    </a>
                    <hr class="sidebar-divider my-0"/>
                    <ul class="nav navbar-nav text-light" id="accordionSidebar">
                        <li class="nav-item" role="presentation"><a class="nav-link" href="/View/formCliente.aspx"><i class="fas fa-user"></i><span>Clientes</span></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="/View/formFactura.aspx"><i class="fas fa-file-invoice-dollar"></i><span>Facturas</span></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="/View/formProducto.aspx"><i class="fas fa-archive"></i><span>Productos</span></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="/View/formSucursal.aspx"><i class="fas fa-store"></i><span>Sucursal</span></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="/View/formProveedor.aspx"><i class="fas fa-truck-loading"></i><span>Proveedor</span></a></li>
                    </ul>
                    <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
                </div>
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                        <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                            <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Buscar..."/>
                                    <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                </div>
                            </form>
                            <ul class="nav navbar-nav flex-nowrap ml-auto">
                                <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><i class="fas fa-search"></i></a>
                                    <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" role="menu" aria-labelledby="searchDropdown">
                                        <form class="form-inline mr-auto navbar-search w-100">
                                            <div class="input-group"><input/ class="bg-light form-control border-0 small" type="text" placeholder="Buscar ..."/>
                                                <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                                <div class="d-none d-sm-block topbar-divider"/></div>
                                <li class="nav-item dropdown no-arrow" role="presentation">
                                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">Admin</span><img class="border rounded-circle img-profile" src="/content/assets/img/avatars/avatar1.jpeg"/></a>
                                        <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
                                            <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Perfíl</a>
                                            <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Configuración</a>
                                            <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Salir</a></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container-fluid">
                        <div class="d-sm-flex justify-content-between align-items-center mb-4">
                            <h3 class="text-dark mb-0">Folio: #0001</h3></div>
                            <div class="row">
                                <div class="col d-flex justify-content-end" style="margin-bottom: 15px;"><a class="btn btn-primary" href="#" type="button"><i class="fas fa-arrow-left"></i> Volver</a></div>
                            </div>
                            <form id="form1" runat="server">
                                <div class="shadow card" style="margin-top: 10px;margin-bottom: 10px;"><a class="btn btn-link text-left card-header font-weight-bold" data-toggle="collapse" aria-expanded="false" aria-controls="collapse-3" href="#collapse-3" role="button">Detalle Factura</a>
                                    <div class="collapse show" id="collapse-3">
                                        <div class="card-body">
                                            <div class="form-row" style="margin-top: 10px;margin-bottom: 10px;">
                                                <div class="col"><label>Producto</label><select class="form-control"><optgroup label="This is a group"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                                                <div class="col"><label>Precio Unitario</label><input class="form-control" type="text"></div>
                                                <div class="col"><label>Cantidad</label><input class="form-control" type="text"></div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col d-flex justify-content-end" style="margin-bottom: 15px;"><button class="btn btn-primary" type="button">Agregar Producto</button></div>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Precio</th>
                                                            <th>Cantidad</th>
                                                            <th>Subtotal</th>
                                                            <th class="text-center">Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Producto 1</td>
                                                            <td>$ 100</td>
                                                            <td>5</td>
                                                            <td>$ 500</td>
                                                            <td class="d-flex justify-content-around"><button class="btn btn-primary" type="button">Editar</button><button class="btn btn-danger" type="button">Eliminar</button></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Producto 2<br></td>
                                                            <td>$ 200</td>
                                                            <td>9</td>
                                                            <td>$ 1800</td>
                                                            <td class="d-flex justify-content-around"><button class="btn btn-primary" type="button">Editar</button><button class="btn btn-danger" type="button">Eliminar</button></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © 07IDVA 2020</span></div>
            </div>
        </footer>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
    <script>

        $("#btnSample").click(function () {
            $.ajax({
                type: "POST",
                url: "formFactura.aspx/SeleccionCliente",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    console.log(msg);
                    // Do something interesting here.
                }
            });
        });
    </script>
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/jquery.js"></script>
    <script src="../Scripts/chart.min.js"></script>
    <script src="../Scripts/bs-init.js"></script>
    <script src="../Scripts/theme.js"></script>
</body>
