<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administradorClientes.aspx.cs" Inherits="TP_Promo_Web.PaginasAdmin.administradorClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="dgvClientes" runat="server" AutoGenerateColumns="false" CssClass ="table table-dark">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Documento" HeaderText="Documento" ReadOnly="True" SortExpression="Documento" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                    <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                    <asp:BoundField DataField="CP" HeaderText="CP" SortExpression="CP" />
                    <asp:HyperLinkField Text="Editar" DataNavigateUrlFields="Documento" DataNavigateUrlFormatString="AgregarCliente.aspx?Documento={0}" />
                </Columns> 
            </asp:GridView>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
