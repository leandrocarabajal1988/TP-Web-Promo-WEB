<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paso2.aspx.cs" Inherits="TP_Promo_Web.Presentacion.Paso2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seleccioná tu premio</title>
    <style>
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
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.8);
        }

        .modal-content {
            margin: auto;
            display: block;
            max-width: 80%;
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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <h2>Seleccioná tu premio</h2>
        <div class="container text-center">
            <div class="row row-cols-2">
                <asp:Repeater ID="rptPremios" runat="server">
                    <ItemTemplate>
                        <div style="margin-bottom: 30px; border-bottom: 1px solid #ccc;" class="col grid text-center overflow-x-auto">
                            <div>
                                <strong><%# Eval("Nombre") %></strong><br />
                            </div>
                            <div>
                                <em><%# Eval("Descripcion") %></em><br />
                            </div>
                            <div class="g-col-2">
                                <span>Precio: $<%# Eval("Precio") %></span><br />
                            </div>
                            <!--Tengo que mostrar el precio si es un premio???-->
                            <div>
                                <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%# Eval("Imagenes") %>'>
                                    <ItemTemplate>
                                        <img src='<%# Container.DataItem %>' alt="Imagen" width="150" class="premio-img img-thumbnail" style="margin: 5px;" onclick="abrirModal('<%# Container.DataItem %>')" />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <asp:Button Text="Elegir" class="btn btn-secondary" runat="server" />
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>

