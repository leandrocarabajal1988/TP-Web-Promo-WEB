<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paso2.aspx.cs" Inherits="TP_Promo_Web.Presentacion.Paso2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seleccioná tu premio</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Seleccioná tu premio</h2>
        <asp:Repeater ID="rptPremios" runat="server">
            <ItemTemplate>
                <div style="margin-bottom:30px; border-bottom:1px solid #ccc;">
                    <strong><%# Eval("Nombre") %></strong><br />
                    <em><%# Eval("Descripcion") %></em><br />
                    <span>Precio: $<%# Eval("Precio") %></span><br />                <!--Tengo que mostrar el precio si es un premio???-->
                    <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%# Eval("Imagenes") %>'>
                        <ItemTemplate>
                            <img src='<%# Container.DataItem %>' alt="Imagen" width="150" style="margin:5px;" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>

