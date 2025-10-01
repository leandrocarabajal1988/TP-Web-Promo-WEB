<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paso3.aspx.cs" Inherits="TP_Promo_Web.Presentacion.Paso3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro del Cliente</title>
    <style>
        .form-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-family: Arial;
            background-color: #f9f9f9;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 12px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 4px;
        }

        .form-group input {
            width: 100%;
            padding: 6px;
            box-sizing: border-box;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #0078D7;
            color: white;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #005fa3;
        }

        .mensaje {
            text-align: center;
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Registro del Cliente</h2>

            <div class="form-group">
                <label for="txtDNI">DNI</label>
                <asp:TextBox ID="txtDNI" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtApellido">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtFecha">Fecha</label>
                <asp:TextBox ID="txtFecha" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtDireccion">Dirección</label>
                <asp:TextBox ID="txtDireccion" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtCiudad">Ciudad</label>
                <asp:TextBox ID="txtCiudad" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtCP">Código Postal</label>
                <asp:TextBox ID="txtCP" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtPais">País</label>
                <asp:TextBox ID="txtPais" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtTelefono">Teléfono</label>
                <asp:TextBox ID="txtTelefono" runat="server" />
            </div>

            <asp:Button ID="btnParticipar" runat="server" Text="Participar!" CssClass="btn-submit" OnClick="btnParticipar_Click" />

            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" />
        </div>
    </form>
</body>
</html>

