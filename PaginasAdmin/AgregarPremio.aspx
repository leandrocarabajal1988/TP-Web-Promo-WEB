<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPremio.aspx.cs" Inherits="TP_Promo_Web.PaginasAdmin.AgregarPremio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            <label>ID:</label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" ReadOnly="true" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Código:</label>
            <asp:TextBox ID="txtCod" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Descripción:</label>
            <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Precio:</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

    </form>
</body>
</html>
