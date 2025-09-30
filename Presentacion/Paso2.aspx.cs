using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_Promo_Web.Negocio;

namespace TP_Promo_Web.Presentacion
{
    public partial class Paso2 : System.Web.UI.Page
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
    }
}