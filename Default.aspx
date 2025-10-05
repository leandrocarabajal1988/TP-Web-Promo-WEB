<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_Promo_Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <h2>Paginas Presentacion</h2>

        <div class="row">
            <div class="col-sm-6 mb-3 mb-sm-0" style="padding: 20px">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Ingresar codigo voucher</h5>
                        <p class="card-text">Ingresar Codigo voucher.</p>
                        <a href="Presentacion/Paso1.aspx" class="btn btn-primary">ver</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6" style="padding: 20px">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">ELegir premio</h5>
                        <p class="card-text">Pagina para elegir el premio.</p>
                        <a href="Presentacion/Paso2.aspx" class="btn btn-primary">ver</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6" style="padding: 20px">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Registrarse</h5>
                        <p class="card-text">Registro de los datos del cliente anotado al sorteo.</p>
                        <a href="Presentacion/Paso3.aspx" class="btn btn-primary">ver</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6" style="padding: 20px">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Ya registrado</h5>
                        <p class="card-text">Pagina confirmacion de registro exitoso.</p>
                        <a href="Presentacion/Exito.aspx" class="btn btn-primary">ver</a>
                    </div>
                </div>
            </div>

            <hr / style="margin:20px">

            <h2>Paginas Administrador</h2>

            <div class="row">
                <div class="col-sm-6 mb-3 mb-sm-0" style="padding: 20px">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Administrador Premios</h5>
                            <p class="card-text">Agregar, Modificar y Borrar Premios.</p>
                            <a href="PaginasAdmin/administradorArticulos.aspx" class="btn btn-primary">ver</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6" style="padding: 20px">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Pagina Agregar y Modificar Premios</h5>
                            <p class="card-text">Pagina para la carga y modificacion de Premios.</p>
                            <a href="PaginasAdmin/AgregarPremio.aspx" class="btn btn-primary">ver</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6" style="padding: 20px">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Pagina Adminsitrador Clientes</h5>
                            <p class="card-text">Ver y modificar Clientes registrados en el sistema.</p>
                            <a href="PaginasAdmin/administradorClientes.aspx" class="btn btn-primary">ver</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6" style="padding: 20px">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Pagina Modificar Cliente</h5>
                            <p class="card-text">Redirecciona a clientes ya que para ingresar hay que seleccionar un cliente.</p>
                            <a href="PaginasAdmin/agregarCliente.aspx" class="btn btn-primary">ver</a>
                        </div>
                    </div>
                </div>
    </main>

</asp:Content>
