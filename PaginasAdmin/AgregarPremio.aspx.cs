using System;
using System.Collections.Generic;
using System.Diagnostics;
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
        protected bool premioError;
        protected bool premioSuccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            premioError = false;

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
                            premioError = true;
                            txtError.Text = "No se pudo encontrar premio en la base de datos";
                        }
                        else
                        {
                            // si encontró
                            txtId.Text = premioModificar.Id.ToString();
                            txtCod.Text = premioModificar.Codigo;
                            txtNombre.Text = premioModificar.Nombre;
                            txtDesc.Text = premioModificar.Descripcion;
                            txtPrecio.Text = premioModificar.Precio.ToString();
                            /// FALTA LISTA IMAGENES

                        }
                    }
                    catch (Exception ex)
                    {
                        premioError = true;
                        txtError.Text = "Error, Revise los datos y vuelva a cargar";
                        Console.WriteLine(ex);
                    }
                }
            }
        }

        protected void brnAceptar_Click(object sender, EventArgs e)
        {
            PremioNegocio negocio = new PremioNegocio();
            Premio premioCargar = new Premio(); ;
            try
            {
                if (Request.QueryString["Id"] != null) { premioCargar.Id = int.Parse(Request.QueryString["Id"]); }


                if (txtCod.Text != "" && txtNombre.Text != "" && txtDesc.Text != "" && txtPrecio.Text != "")
                {
                    premioCargar.Codigo = txtCod.Text;
                    premioCargar.Nombre = txtNombre.Text;
                    premioCargar.Descripcion = txtDesc.Text;
                    premioCargar.Precio = decimal.Parse(txtPrecio.Text);
                    /// FALTA LISTA IMAGENES
                    /// 

                    if (Request.QueryString["Id"] == null)
                    {
                        // Cargado nuevo premio
                        // negocio.agregar(premio);
                        try
                        {
                            if (negocio.agregar(premioCargar)) { premioSuccess = true; txtSuccess.Text = "Premio SUbido correctamente"; }
                        }
                        catch (Exception ex)
                        {
                            premioError = true;
                            txtError.Text = "Problema al cargar Premio";
                        }
                    }
                    else if (Request.QueryString["Id"] != null)
                    {
                        // Modificando articulo
                        // negocio.modificar(premio);
                        try
                        {
                            if (negocio.modificar(premioCargar)) { premioSuccess = true; txtSuccess.Text = "Premio Modificado correctamente"; }
                            else { premioError = true; txtError.Text = "Error modificando premio"; }
                        }
                        catch (Exception ex)
                        {
                            premioError = true;
                            txtError.Text = "Problema al modificar Premio";
                        }
                    }


                }
                else { premioError = true; txtError.Text = "Llene todos los campos"; }
            }
            catch (Exception ex)
            {
                premioError = true;
                txtError.Text = "Error al Cargar Premio";
            }

        }
    }
}