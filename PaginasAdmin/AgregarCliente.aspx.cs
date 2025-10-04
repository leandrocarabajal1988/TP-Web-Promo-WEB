using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TP_Promo_Web.Dominio;
using TP_Promo_Web.Negocio;


namespace TP_Promo_Web.PaginasAdmin
{
    public partial class AgregarCliente : System.Web.UI.Page
    {
        protected Cliente clienteModificar;
        protected bool clienteError;
        protected bool clienteSuccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            clienteError = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["Documento"] == null)
                {
                    Response.Redirect("administradorClientes.aspx");
                    return;
                }
                if (Request.QueryString["Documento"] != null)
                {
                    try
                    {
                        string documento = Request.QueryString["Documento"].ToString();
                        ClienteNegocio negocio = new ClienteNegocio();
                        Cliente clienteModificar = negocio.BuscarPorDocumento(documento);

                        if (clienteModificar == null)
                        {
                            // no encuentra cliente en busca x documento
                            clienteError = true;
                            lblError.Text = "No se pudo encontrar cliente en la base de datos";
                        }
                        else
                        {
                            // si encontró
                            txtId.Text = clienteModificar.Id.ToString();
                            txtDocumento.Text = clienteModificar.Documento.ToString();
                            txtNombre.Text = clienteModificar.Nombre;
                            txtApellido.Text = clienteModificar.Apellido;
                            txtEmail.Text = clienteModificar.Email;
                            txtDireccion.Text = clienteModificar.Direccion;
                            txtCiudad.Text = clienteModificar.Ciudad;
                            txtCP.Text = clienteModificar.CP.ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        clienteError = true;
                        lblError.Text = "Error, Revise los datos y vuelva a cargar";
                        Console.WriteLine(ex);
                    }
                }
            }
        }

        protected void brnAceptar_Click(object sender, EventArgs e)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            Cliente clienteCargar = new Cliente();
            try
            {
                clienteCargar.Documento = txtDocumento.Text;

                if (string.IsNullOrEmpty(txtDocumento.Text) || string.IsNullOrEmpty(txtNombre.Text) || string.IsNullOrEmpty(txtApellido.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtDireccion.Text) || string.IsNullOrEmpty(txtCiudad.Text) || string.IsNullOrEmpty(txtCP.Text))
                {
                    clienteError = true;
                    lblError.Text = "Por favor, complete todos los campos.";
                    return;
                }

                clienteCargar.Id = int.Parse(txtId.Text);
                clienteCargar.Documento = txtDocumento.Text;
                clienteCargar.Nombre = txtNombre.Text;
                clienteCargar.Apellido = txtApellido.Text;
                clienteCargar.Email = txtEmail.Text;
                clienteCargar.Direccion = txtDireccion.Text;
                clienteCargar.Ciudad = txtCiudad.Text;
                clienteCargar.CP = int.Parse(txtCP.Text);
                negocio.Actualizar(clienteCargar);
                clienteSuccess = true;
                lblSuccess.Text = "Cliente modificado exitosamente.";
            }
            catch (Exception ex)
            {
                clienteError = true;
                lblError.Text = "Error, Revise los datos y vuelva a cargar";
                Console.WriteLine(ex);
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string documento = Request.QueryString["Documento"].ToString();
                ClienteNegocio negocio = new ClienteNegocio();
                if (txtId.Text != "")
                {
                    if (negocio.BuscarPorDocumento(documento) != null)
                    {
                        negocio.Eliminar(documento);
                        clienteSuccess = true;
                        txtId.Text = "";
                        txtDocumento.Text = "";
                        txtNombre.Text = "";
                        txtApellido.Text = "";
                        txtDireccion.Text = "";
                        txtCiudad.Text = "";
                        txtCP.Text = "";
                        lblSuccess.Text = "Cliente Eliminado Correctamente redireccionando ...";
                        /// estaria bueno hacerle un delay antes de redirigir
                        Response.Redirect("administradorClientes.aspx");
                        /// FALTA LISTA IMAGENES
                    }
                    else
                    {
                        clienteError = true;
                        lblError.Text = "no se encontro cliente en base de datos: ";
                    }
                }
                else
                {
                    clienteError = true;
                    lblError.Text = "no hay id cliente a eliminar: ";
                }
            }
            catch (Exception ex)
            {
                clienteError = true;
                lblError.Text = "Ocurrió un error al eliminar: ";
                Console.WriteLine(ex);

            }
        }

    }
}