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
</head>
<body>
    <form id="form1" runat="server">
        <h2>Seleccioná tu premio</h2>
        <asp:Repeater ID="rptPremios" runat="server">
            <ItemTemplate>
                <div style="margin-bottom: 30px; border-bottom: 1px solid #ccc;">
                    <strong><%# Eval("Nombre") %></strong><br />
                    <em><%# Eval("Descripcion") %></em><br />
                    <span>Precio: $<%# Eval("Precio") %></span><br />
                    <!--Tengo que mostrar el precio si es un premio???-->
                    <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%# Eval("Imagenes") %>'>
                        <ItemTemplate>
                            <img src='<%# Container.DataItem %>' alt="Imagen" width="150" class="premio-img" style="margin: 5px;" onclick="abrirModal('<%# Container.DataItem %>')" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
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
</body>
</html>

