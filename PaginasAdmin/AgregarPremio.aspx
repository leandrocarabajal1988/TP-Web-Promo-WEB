<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPremio.aspx.cs" Inherits="TP_Promo_Web.PaginasAdmin.AgregarPremio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .Error {
            color:red;

        
        }

    </style>




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

        

        <%if (premioError == 1)
            {  %>
        <asp:Label Text="No se pudo encontrar Premio en base de datos" runat="server" CssClass="Error" />
        <%}else if(premioError == 2){  %>
        <asp:Label Text="Error Desconocido / Vuelva a seleccionar premio" runat="server" CssClass="Error"/>
        <%} %>

        <%if (Request.QueryString["Id"] != null)
            {  %>
            <asp:Button ID="btnAccion" Text="Modificar Existente" runat="server" onclick="brnAceptar_Click"/>
        <%}else{  %>
        <asp:Button ID="btnAceptar" Text="Subir Nuevo" runat="server" onclick="brnAceptar_Click"/>
        <%} %>
    </form>
</body>
</html>
