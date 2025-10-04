<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="TP_Promo_Web.PaginasAdmin.AgregarCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .Error {
            color: red;
        }



        .Success {
            color: green;
        }
    </style>



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="form-group">
            <label>ID:</label>
            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" ReadOnly="true" Text=''></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">Documento:</label>
            <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Apellido:</label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" TextMode="MultiLine" Text=''></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div>
            <label>Direccion:</label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div>
            <label>Ciudad:</label>
            <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>

        <div>
            <label>Codigo Postal:</label>
            <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" Text=''></asp:TextBox>
        </div>


        <%if (clienteError == true)
            {  %>
        <asp:Label ID="lblError" Text="Error" runat="server" CssClass="Error" />
        <%}  %>

        <%if (clienteSuccess == true)
            {  %>
        <asp:Label ID="lblSuccess" Text="Success" runat="server" CssClass="Success" />
        <%}  %>


        <%if (Request.QueryString["Documento"] != null)
            {  %>
        <asp:Button ID="btnAccion" Text="Modificar Existente" runat="server" OnClick="brnAceptar_Click" />
        <asp:Button ID="btnEliminar" Text="Eliminar Articulo" runat="server" CssClass="Error" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro que desea eliminar este producto?');" />
        <%}
            else
            {  %>
        <asp:Button ID="btnAceptar" Text="Subir Nuevo" runat="server" OnClick="brnAceptar_Click" />
        <%} %>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
