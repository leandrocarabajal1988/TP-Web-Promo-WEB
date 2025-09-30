using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_Promo_Web.Datos;
using TP_Promo_Web.Dominio;

namespace TP_Promo_Web.Negocio
{
    public class PremioNegocio
    {
        public List<Premio> Listar()
        {
            List<Premio> lista = new List<Premio>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // busco todos los artículos
                datos.setConsulta("SELECT Id, Codigo, Nombre, Descripcion, Precio FROM ARTICULOS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Premio p = new Premio();
                    p.Id = (int)datos.Lector["Id"];
                    p.Codigo = datos.Lector["Codigo"].ToString();
                    p.Nombre = datos.Lector["Nombre"].ToString();
                    p.Descripcion = datos.Lector["Descripcion"].ToString();
                    p.Precio = (decimal)datos.Lector["Precio"];
                    p.Imagenes = ObtenerImagenes(p.Id);

                    lista.Add(p);
                }

                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
            }
        }

        private List<string> ObtenerImagenes(int idArticulo)
        {
            List<string> imagenes = new List<string>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT ImagenUrl FROM IMAGENES WHERE IdArticulo = @id");
                datos.setearParametro("@id", idArticulo);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    imagenes.Add(datos.Lector["ImagenUrl"].ToString());
                }

                datos.cerrarConexion();
                return imagenes;
            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
            }
        }
    }
}
