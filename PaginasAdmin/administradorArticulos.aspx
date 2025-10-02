<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administradorArticulos.aspx.cs" Inherits="TP_Promo_Web.PaginasAdmin.administradorArticulos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seleccioná tu premio</title>
    <style>
        .navbar {
            margin-bottom: 30px;
        }
        .premio-img {
            transition: transform 0.3s ease;
            cursor: pointer;
        }

            .premio-img:hover {
                transform: scale(1.1);
            }

        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            padding-top: 60px;
            left: 0;
            top: 0;
            width: auto;
            height: auto;
            overflow: auto;
            background-color: rgba(0,0,0,0.8);
        }

        .modal-content {
            margin: auto;
            display: block;
            max-width: 40%;
            max-height: 80%;
            border-radius: 10px;
        }

        .close {
            position: absolute;
            top: 30px;
            right: 50px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"/>
</head>
<body>
    <header>
                <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
            <div class="container">
                <p class="navbar-brand" runat="server">Administrador Articulos</p>
                <a class="navbar-brand" runat="server" href="~/">x</a>
            </div>
        </nav>
    </header>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptPremios" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card" style="width: 24rem;">
                                <%-- Sección de imágenes con carousel si hay múltiples imágenes --%>
                                <div id="carousel<%# Container.ItemIndex %>" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%# Eval("Imagenes") %>'>
                                            <ItemTemplate>
                                                <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                                    <img src='<%# Container.DataItem %>' class="card-img-top" alt="Imagen Premio" style="height: 200px; object-fit: cover;" onclick="abrirModal('<%# Container.DataItem %>')" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%# Container.ItemIndex %>" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carousel<%# Container.ItemIndex %>" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>

                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                </div>

                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <strong>Precio:</strong> $<%# Eval("Precio") %>
                                    </li>
                                </ul>

                                <div class="card-body text-center">
                                    <asp:Button 
    Text="Modificar"
    CssClass="btn btn-primary w-100" 
    runat="server" 
    CommandName="Modificar"
    CommandArgument='<%# Eval("Id") %>' 
    OnCommand="Modificar_Command" />

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <script>
        function abrirModal(src) {
            var modal = document.getElementById("modalImagen");
            var img = document.getElementById("imgModal");
            modal.style.display = "block";
            img.src = src;
        }

        function cerrarModal() {
            document.getElementById("modalImagen").style.display = "none";
        }
    </script>
    <div id="modalImagen" class="modal" onclick="cerrarModal()">
        <span class="close" onclick="cerrarModal()">&times;</span>
        <img class="modal-content" id="imgModal" />
    </div>

    <footer>Footer</footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
