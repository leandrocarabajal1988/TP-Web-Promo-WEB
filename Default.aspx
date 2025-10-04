<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_Promo_Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <h1>Menu</h1>

        <h2>Administrador</h2>
        <a href="PaginasAdmin/administradorArticulos.aspx">Articulos</a>
        <a href="PaginasAdmin/administradorClientes.aspx">Clientes</a>


        <h2>Presentacion</h2>
        <a href="Presentacion/Paso1.aspx">Presentacion/Paso1.aspx</a>
        <a href="Presentacion/Paso2.aspx">Presentacion/Paso2.aspx</a>
        <a href="Presentacion/Paso3.aspx">Presentacion/Paso3.aspx</a>
        <a href="Presentacion/Exito.aspx">Presentacion/Exito.aspx</a>

    </main>

</asp:Content>
