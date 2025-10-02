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
        protected int premioError ;
        protected void Page_Load(object sender, EventArgs e)
        {
            premioError = 0;

            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    try
                    {
                        int id = int.Parse(Request.QueryString["Id"]);
                        // Hacer nuevo objeto premio y premio negocio buscar id y guardar en premio
                        PremioNegocio negocio = new PremioNegocio();
                        Premio premioModificar = negocio.buscarPorID(id);

                        if (premioModificar == null)
                        {
                            // no encuentra premio en busca x id
                            premioError = 1;
                        }
                        else 
                        {
                            // si encontró
                            txtId.Text = premioModificar.Id.ToString();
                            txtCod.Text = premioModificar.Codigo;
                            txtNombre.Text = premioModificar.Nombre;
                            txtDesc.Text = premioModificar.Descripcion;
                            txtPrecio.Text = premioModificar.Precio.ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        premioError = 2;
                        txtId.Text = "Problema Leyendo ID de premio a modificar";
                        Console.WriteLine(ex);
                    }
                }
                else
                {
                    // Si vino sin parametro Id viene vacio
                    // Hacer Cargado d nuevo premio
                    
                }


            }
        }

        protected void brnAceptar_Click(object sender, EventArgs e)
        {
            PremioNegocio negocio = new PremioNegocio();
            Premio premioCargar = new Premio();

            premioCargar.Id = int.Parse(txtId.Text);
            premioCargar.Codigo = txtCod.Text;
            premioCargar.Nombre = txtNombre.Text;
            premioCargar.Descripcion = txtDesc.Text;
            premioCargar.Precio = decimal.Parse(txtPrecio.Text);

            
        }
    }
}