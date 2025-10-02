<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPremio.aspx.cs" Inherits="TP_Promo_Web.PaginasAdmin.AgregarPremio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .Error {
            color: red;
        }

        .form-group {
            width: 50%;
            height: auto;
            display: grid;
        }
        .Success {
            color:green;
        }
    </style>




</head>
<body>
    <form id="form1" runat="server">

        <%if (Request.QueryString["Id"] != null)
            {  %>
        <div class="form-group">
            <label>ID:</label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" ReadOnly="true" Text=''></asp:TextBox>
        </div>
        <%}
            else
            {  %>

        <%} %>




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



        <%if (premioError == true)
            {  %>
        <asp:Label ID="txtError" Text="Error" runat="server" CssClass="Error" />
        <%}  %>

        <%if (premioSuccess == true)
            {  %>
        <asp:Label ID="txtSuccess" Text="Success" runat="server" CssClass="Success" />
        <%}  %>


        <%if (Request.QueryString["Id"] != null)
            {  %>
        <asp:Button ID="btnAccion" Text="Modificar Existente" runat="server" OnClick="brnAceptar_Click" />
        <%}
            else
            {  %>
        <asp:Button ID="btnAceptar" Text="Subir Nuevo" runat="server" OnClick="brnAceptar_Click" />
        <%} %>
    </form>
</body>
</html>
