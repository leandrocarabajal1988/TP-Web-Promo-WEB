using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TP_Promo_Web.Dominio;
using TP_Promo_Web.Negocio;

namespace TP_Promo_Web.Presentacion
{
    public partial class Paso3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private Cliente BuscarPorDocumento(string documento)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            return negocio.BuscarPorDocumento(documento);
        }

        private void GuardarCliente(Cliente cliente)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            negocio.Guardar(cliente);
        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDocumento.Text) ||
                string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtApellido.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                string.IsNullOrWhiteSpace(txtCiudad.Text) ||
                string.IsNullOrWhiteSpace(txtCP.Text))
            {
                lblMensaje.Text = "Por favor completá todos los campos.";
                return;
            }

            Cliente cliente = new Cliente
            {
                Documento = txtDocumento.Text,
                Nombre = txtNombre.Text,
                Apellido = txtApellido.Text,
                Email = txtEmail.Text,
                Direccion = txtDireccion.Text,
                Ciudad = txtCiudad.Text,
                CP = Convert.ToInt32(txtCP.Text),
            };

            ClienteNegocio negocio = new ClienteNegocio();
            Cliente validar = negocio.BuscarPorDocumento(cliente.Documento);

            if (validar == null) 
            {
            GuardarCliente(cliente);
            Response.Redirect("Exito.aspx");
            }
            else
            {
                lblMensaje.Text = "Cliente Ya existente.";
            }

        }

        protected void btnBuscarPorDocumento_Click(object sender, EventArgs e)
        {
            string documento = txtDocumento.Text.Trim();
            Cliente cliente = BuscarPorDocumento(documento);

            if (cliente != null)
            {
                txtNombre.Text = cliente.Nombre;
                txtApellido.Text = cliente.Apellido;
                txtEmail.Text = cliente.Email;
                txtDireccion.Text = cliente.Direccion;
                txtCiudad.Text = cliente.Ciudad;
                txtCP.Text = cliente.CP.ToString();

                lblMensaje.Text = "Datos encontrados. Verificá y completá los campos restantes.";
            }
            else
            {
                lblMensaje.Text = "No se encontró ningún cliente con ese documento.";
            }
        }


    }
}