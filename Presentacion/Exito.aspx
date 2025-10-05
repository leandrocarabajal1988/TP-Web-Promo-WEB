<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exito.aspx.cs" Inherits="TP_Promo_Web.Presentacion.Exito" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>¡Registro exitoso!</title>
    <style>
        body {
            background-image: url('../img/exito.png');
            background-repeat: repeat;
            background-size: auto;
        }

        .exito-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            text-align: center;
            font-family: Arial;
            background-color: #e6ffe6;
            border: 1px solid #b2d8b2;
            border-radius: 10px;
        }

            .exito-container h2 {
                color: #2e7d32;
            }

        .resumen {
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="exito-container">
        <h2>¡Gracias por participar!</h2>
        <asp:Label ID="lblResumen" runat="server" CssClass="resumen" />
    </div>

    <div class="text-center mt-5 mb-5">
<asp:Button ID="btnVolverInicio" runat="server" Text="🔄 Cargar otro baucher" PostBackUrl="~/Presentacion/Paso1.aspx" CssClass="btn btn-success btn-lg" />
</div>
</form>
    </form>
</body>
</html>

