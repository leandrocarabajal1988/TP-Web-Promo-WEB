<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paso1.aspx.cs" Inherits="TP_Promo_Web.Presentacion.Paso1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Promo Ganá - Paso 1</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Promo Ganá!</h2>
        <label for="txtCodigo">Ingresá el código de tu voucher:</label><br />
        <asp:TextBox ID="txtCodigo" runat="server" /><br /><br />
        <asp:Button ID="btnValidar" runat="server" Text="Siguiente" OnClick="btnValidar_Click" /><br /><br />
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
    </form>
</body>
</html>

