using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_Promo_Web.Dominio;

namespace TP_Promo_Web.Presentacion
{
    public partial class Exito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["ClienteRegistrado"] is Cliente cliente)
            {
                lblResumen.Text = $"Cliente registrado: {cliente.Nombre} {cliente.Apellido} ({cliente.Documento})";
            }
            else
            {
                lblResumen.Text = "Tu participación fue registrada correctamente.";
            }
        }
    }
}
