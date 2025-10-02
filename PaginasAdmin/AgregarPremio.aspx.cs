using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_Promo_Web.Dominio;
using TP_Promo_Web.Negocio;

namespace TP_Promo_Web.PaginasAdmin
{
    public partial class AgregarPremio : System.Web.UI.Page
    {
        protected Premio premioModificar;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    int id = int.Parse(Request.QueryString["Id"]);
                    // Hacer nuevo objeto premio y premio negocio buscar id y guardar en premio
                    PremioNegocio negocio = new PremioNegocio();
                    Premio premioModificar = negocio.buscarPorID(id);

                    // Falta hacer funcion que vaya y cambie datos en base de datos
                    txtId.Text = premioModificar.Id.ToString();
                    txtCod.Text = premioModificar.Codigo;
                    txtNombre.Text = premioModificar.Nombre;
                    txtDesc.Text = premioModificar.Descripcion;
                    txtPrecio.Text = premioModificar.Precio.ToString();
                }
                else
                {
                    // Si vino sin parametro Id viene vacio
                    // Hacer Cargado d nuevo premio
                }
            }
        }
    }
}