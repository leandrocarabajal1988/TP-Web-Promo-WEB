using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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

        public Premio buscarPorID(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Premio auxiliar = null;

            try
            {
                string consulta = "SELECT Id, Codigo, Nombre, Descripcion, Precio FROM ARTICULOS WHERE Id = @Id";
                datos.setConsulta(consulta);
                datos.Comando.Parameters.Clear();
                datos.Comando.Parameters.AddWithValue("@Id", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    auxiliar = new Premio();
                    auxiliar.Id = (int)datos.Lector["id"];
                    auxiliar.Codigo = (string)datos.Lector["Codigo"];
                    auxiliar.Nombre = (string)datos.Lector["Nombre"];
                    auxiliar.Descripcion = (string)datos.Lector["Descripcion"];
                    auxiliar.Precio = (decimal)datos.Lector["Precio"];
                }

                return auxiliar;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally 
            {
                datos.cerrarConexion();
            }

        }

    }
}
