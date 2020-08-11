<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formFactura.aspx.cs" Inherits="WebFacturacion3.View.Facturas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Content/bootstrap.min.css" />
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/fonts/fontawesome-all.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Facturas</title>
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-file-invoice"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>Facturación</span></div>
                </a>
                <hr class="sidebar-divider my-0" />
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
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3"
                            id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <ul class="nav navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link"
                                    data-toggle="dropdown" aria-expanded="false" href="#"><i
                                        class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" role="menu"
                                    aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small"
                                                type="text" placeholder="Buscar ..." />
                                            <div class="input-group-append"><button class="btn btn-primary py-0"
                                                    type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider" />
                            <li class="nav-item dropdown no-arrow" role="presentation">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">Admin</span><img class="border rounded-circle img-profile" src="/content/assets/img/avatars/avatar1.jpeg" /></a>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu">
                                        <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Perfíl</a>
                                        <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Configuración</a>
                                        <a class="dropdown-item" role="presentation" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Salir</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Facturas</h3>
                    </div>
                    <form id="form1" runat="server">
                        <div class="row">
                            <div class="col d-flex justify-content-end" style="margin-bottom: 15px;"><button
                                    class="btn btn-primary" data-toggle="collapse" aria-expanded="true"
                                    aria-controls="collapse-4" href="#collapse-4" type="button">Agregar Factura</button>
                            </div>
                        </div>
                        <div class="shadow card"><a class="btn btn-link text-left card-header font-weight-bold"
                                data-toggle="collapse" aria-expanded="false" aria-controls="collapse-4"
                                href="#collapse-4" role="button">Facturas</a>
                            <div class="collapse show" id="collapse-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 text-nowrap">
                                            <div id="dataTable_length" class="dataTables_length"
                                                aria-controls="dataTable"><label>Ver&nbsp;<select
                                                        class="form-control form-control-sm custom-select custom-select-sm">
                                                        <option value="10" selected="">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select>&nbsp;</label></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="text-md-right dataTables_filter" id="dataTable_filter">
                                                <label><input type="search" class="form-control form-control-sm"
                                                        aria-controls="dataTable" placeholder="Buscar"></label></div>
                                        </div>
                                    </div>
                                    <asp:GridView ID="GVFactura" runat="server" CssClass="table dataTable my-0"></asp:GridView>
                                    <asp:GridView ID="GridViewClientes" runat="server" DataKeyNames="id_Cliente, Nombre, Direccion, Telefono, Email, FechaNacimiento, Rfc" 
                                                  DataAutoGenerateColumns="False" OnRowCommand="ItemClick" OnRowCancelingEdit="GridViewClientes_RowCancelingEdit" CssClass="table table-striped" AllowPaging="True" OnPageIndexChanging="GridViewClientes_PageIndexChanging" PageSize="1">
                                                <HeaderStyle CssClass="thead-dark"/>
                                                <Columns>
                                                    <asp:ButtonField CommandName="Eliminar" Text="Eliminar" ControlStyle-CssClass="btn btn-outline-danger">
                                                        <ControlStyle CssClass="btn btn-outline-danger"></ControlStyle>
                                                    </asp:ButtonField>
                                                    <asp:ButtonField CommandName="Actualizar" Text="Editar" ControlStyle-CssClass="btn btn-outline-success">
                                                        <ControlStyle CssClass="btn btn-outline-success"></ControlStyle>
                                                    </asp:ButtonField>
                                                </Columns>
                                                <pagerstyle
                                                verticalalign="Bottom"
                                                horizontalalign="Right" BorderStyle="None" Wrap="True" BackColor="Transparent" BorderColor="Transparent" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                    <div class="table-responsive table mt-2" id="fact" role="grid" aria-describedby="dataTable_info">
                                        <table class="table dataTable my-0" id="dataTable">
                                            <thead>
                                                <tr>
                                                    <th>Cliente</th>
                                                    <th>Folio</th>
                                                    <th>Fecha de Emisión</th>
                                                    <th class="text-center">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Airi Satou</td>
                                                    <td>0001</td>
                                                    <td>2008/11/28</td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Angelica Ramos</td>
                                                    <td>0002</td>
                                                    <td>2009/10/09<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Ashton Cox</td>
                                                    <td>0003<br></td>
                                                    <td>2009/01/12<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Bradley Greer</td>
                                                    <td>0004</td>
                                                    <td>2012/10/13<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Brenden Wagner</td>
                                                    <td>0005</td>
                                                    <td>2011/06/07<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Brielle Williamson</td>
                                                    <td>0006</td>
                                                    <td>2012/12/02<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Bruno Nash<br /></td>
                                                    <td>0007</td>
                                                    <td>2011/05/03<br /></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Caesar Vance</td>
                                                    <td>0008</td>
                                                    <td>2011/12/12<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Cara Stevens</td>
                                                    <td>0009</td>
                                                    <td>2011/12/06<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                                <tr>
                                                    <td>Cedric Kelly</td>
                                                    <td>0010</td>
                                                    <td>2012/03/29<br></td>
                                                    <td class="d-flex justify-content-around"><button
                                                            class="btn btn-primary" type="button">Ver
                                                            Detalle</button><button class="btn btn-danger"
                                                            type="button">Eliminar</button></td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td><strong>Name</strong></td>
                                                    <td><strong>Folio</strong></td>
                                                    <td><strong>Fecha de Emisión</strong></td>
                                                    <td class="text-center"><strong>Acciones</strong></td>
                                                    <td></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 align-self-center">
                                            <p id="dataTable_info" class="dataTables_info" role="status"
                                                aria-live="polite">Mostrando 1 a 10 de 27</p>
                                        </div>
                                        <div class="col-md-6">
                                            <nav
                                                class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                                <ul class="pagination">
                                                    <li class="page-item disabled"><a class="page-link" href="#"
                                                            aria-label="Previous"><span aria-hidden="true">«</span></a>
                                                    </li>
                                                    <li class="page-item active"><a class="page-link" href="#">1</a>
                                                    </li>
                                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link" href="#"
                                                            aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="shadow card"><a class="btn btn-link text-left card-header font-weight-bold"
                                data-toggle="collapse" aria-expanded="false" aria-controls="collapse-2"
                                href="#collapse-2" role="button">Agregar Factura</a>
                            <div class="collapse show" id="collapse-2">
                                <div class="card-body">
                                    <form>
                                        <div class="form-row" style="margin-bottom: 15px;">
                                            <div class="col-lg-3"><label>Folio</label>
                                                <asp:TextBox ID="txtFolio" runat="server" CssClass="form-control"
                                                    placeholder="#0000" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="col"><label>Cliente</label>
                                                <asp:DropDownList runat="server" ID="dropDownClientes"
                                                    OnSelectedIndexChanged="dropDownClientes_SelectedIndexChanged"
                                                    AutoPostBack="false" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div class="col"><label>Fecha</label>
                                                <asp:ScriptManager ID="ScriptManager2" runat="server">
                                                </asp:ScriptManager>
                                                <asp:TextBox ID="txtDate" runat="server" autocomplete="off" CssClass="form-control" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate" Format="yyyy-MM-dd" />
                                            </div>
                                        </div>
                                        <div class="form-row d-flex justify-content-end" style="margin-bottom: 15px;">
                                            <div class="col-lg-3"><label>Total</label>
                                                <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col d-flex justify-content-end" style="margin-bottom: 15px;">
                                                <asp:Button ID="btnGuardar" runat="server" Text="Finalizar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <footer class="bg-white sticky-footer">
                    <div class="container my-auto">
                        <div class="text-center my-auto copyright"><span>Copyright © 07IDVA 2020</span></div>
                    </div>
                </footer>
            </div>
            <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
        </div>
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

</html>