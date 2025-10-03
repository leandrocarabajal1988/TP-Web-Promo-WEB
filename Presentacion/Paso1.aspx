<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paso1.aspx.cs" Inherits="TP_Promo_Web.Presentacion.Paso1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Promo Ganá - Paso 1</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            background-image: url('../img/fondo.png');
            background-repeat: repeat;
            background-size: auto;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2.titulo-paso1 {
            text-align: center;
            font-size: 28px;
            color: #0078D7;
            margin-bottom: 30px;
            font-weight: bold;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn-validar {
            background-color: #0078D7;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

            .btn-validar:hover {
                background-color: #005fa3;
            }

        .mensaje-error {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }

        .premios-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <h2 class="titulo-paso1">¡Promo Ganá!</h2>

            <label for="txtCodigo">Ingresá el código de tu voucher:</label>
            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" />

            <asp:Button ID="btnValidar" runat="server" Text="Siguiente" CssClass="btn-validar" OnClick="btnValidar_Click" />

            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje-error" />

        </div>
    </form>
</body>
</html>

