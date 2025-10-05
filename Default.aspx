<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_Promo_Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <h2>Paginas Presentacion</h2>
        <div class="row">

            <div class="card mb-4" style="max-width: 45%; margin: 2%;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/Paso1.png" class="img-fluid rounded-start" alt="Imagen Paso 1" style="height: 100%; width: 100%">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Ingresar codigo voucher</h5>
                            <p class="card-text">Pagina donde el cliente ingresa el codigo recibido en su compra, en el backend se realiza la verificacion de la valides del codigo.</p>
                            <a href="Presentacion/Paso1.aspx" class="btn btn-secondary btn-sm">ver</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4" style="max-width: 45%; margin: 2%;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/Paso2.png" class="img-fluid rounded-start" alt="Imagen Paso 1" style="height: 100%; width: 100%">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">ELegir premio</h5>
                            <p class="card-text">Pagina donde el cliente con un codigo valido es recibido con el catalogo de premios, con sus fotos y descripcion de los premios disponibles.</p>
                            <a href="Presentacion/Paso2.aspx" class="btn btn-secondary btn-sm">ver</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <div class="row">

            <div class="card mb-4" style="max-width: 45%; margin: 2%;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/Paso3.png" class="img-fluid rounded-start" alt="Imagen Paso 1" style="height: 100%; width: 100%">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Ingresar datos cliente</h5>
                            <p class="card-text">Ya elegido el premio el cliente debe ingresar sus datos para darse de alta en el sistema.</p>
                            <a href="Presentacion/Paso3.aspx" class="btn btn-secondary btn-sm">ver</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4" style="max-width: 45%; margin: 2%;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/Paso4.png" class="img-fluid rounded-start" alt="Imagen Paso 1" style="height: 100%; width: 100%">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Exito</h5>
                            <p class="card-text">Pagina de registro exitoso.</p>
                            <a href="Presentacion/Exito.aspx" class="btn btn-secondary btn-sm">ver</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

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
