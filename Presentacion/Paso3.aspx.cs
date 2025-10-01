using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_Promo_Web.Dominio;
using TP_Promo_Web.Negocio;

namespace TP_Promo_Web.Presentacion
{
    public partial class Paso3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private Cliente BuscarPorDNI(string dni)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            return negocio.BuscarPorDNI(dni);
        }

        private void GuardarCliente(Cliente cliente)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            negocio.Guardar(cliente);
        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente
            {
                DNI = txtDNI.Text,
                Nombre = txtNombre.Text,
                Apellido = txtApellido.Text,
                Email = txtEmail.Text,
                Pais = txtPais.Text,
                Direccion = txtDireccion.Text,
                Ciudad = txtCiudad.Text,
                CP = txtCP.Text,
                Telefono = txtTelefono.Text
            };

            GuardarCliente(cliente);
            Response.Redirect("Exito.aspx");
        }


    }
}