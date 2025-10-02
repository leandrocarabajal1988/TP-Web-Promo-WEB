using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using TP_Promo_Web.Dominio;
using TP_Promo_Web.Negocio;

namespace TP_Promo_Web.PaginasAdmin
{
    public partial class administradorArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PremioNegocio negocio = new PremioNegocio();
                rptPremios.DataSource = negocio.Listar();
                rptPremios.DataBind();
            }

        }

        protected void Modificar_Command(object sender, CommandEventArgs e)
        {
            // De ansioso probando si funca la funcion buscar x id
            //PremioNegocio negocio = new PremioNegocio
            //int idPremio = int.Parse(e.CommandArgument.ToString());
            //Premio premio = negocio.buscarPorID(idPremio);

            int idPremio = int.Parse(e.CommandArgument.ToString());

            // Redirigir al paso 3 con el código y el premio seleccionado
            Response.Redirect($"AgregarPremio.aspx?Id=" + idPremio);

        }
    }
}