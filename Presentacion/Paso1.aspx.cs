using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_Promo_Web.Negocio;
using TP_Promo_Web.Datos;


namespace TP_Promo_Web.Presentacion
{
    public partial class Paso1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnValidar_Click(object sender, EventArgs e)
        {
            string codigo = txtCodigo.Text.Trim();

            VoucherNegocio negocio = new VoucherNegocio();
            bool valido = negocio.ValidarCodigo(codigo);

            if (valido)
            {
                // Si es válido, lo guardás en Session para usarlo en Paso3
                Session["CodigoVoucher"] = codigo;
                Response.Redirect("Paso2.aspx");
            }
            else
            {
                lblMensaje.Text = "El código ingresado no es válido o ya fue utilizado.";
            }
        }
    }
}