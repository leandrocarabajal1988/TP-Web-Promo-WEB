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
            // Si encuentra Retona objeto encontrado
            // Caso contrario devulve null

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

        public bool agregar(Premio nuevo) //creo que no lo pedia en el tp pero dejemoslo por las dudas
        {
            AccesoDatos datos = new AccesoDatos();

            //string insertArticulo = "INSERT INTO ARTICULOS(Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio)" +
            //                        " VALUES(@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @Precio)";

            string insertArticulo = "INSERT INTO ARTICULOS(Codigo, Nombre, Descripcion, Precio)" +
                                    " VALUES(@Codigo, @Nombre, @Descripcion, @Precio)";

            try
            {
                datos.setConsulta(insertArticulo);
                datos.setearParametro("@Codigo", nuevo.Codigo);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                //datos.setearParametro("@IdMarca", nuevo.marca.IdMarca);
                //datos.setearParametro("@IdCategoria", nuevo.categoria.IdCategoria);
                datos.setearParametro("@Precio", nuevo.Precio);

                datos.ejecutarAccion();
                datos.cerrarConexion();

                //NUEVO Agregar la imagen al cargar
                // Obtengo el Id del artículo recién insertado
                datos.setConsulta("SELECT MAX(Id) AS IdArticulo FROM ARTICULOS");
                datos.ejecutarLectura();
                int idArticulo = 0;
                if (datos.Lector.Read())
                {
                    idArticulo = Convert.ToInt32(datos.Lector["IdArticulo"]);
                }
                datos.cerrarConexion();
                // Inserto la imagen
                //string insertImagen = "INSERT INTO IMAGENES(IdArticulo, ImagenUrl) VALUES(@IdArticulo, @ImagenUrl)";
                //datos.setConsulta(insertImagen);
                //datos.setearParametro("@IdArticulo", idArticulo);
                //datos.setearParametro("@ImagenUrl", nuevo.imagen.ImagenUrl);
                //datos.ejecutarAccion();
                //datos.cerrarConexion();
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public bool modificar(Premio art)//lo mismo que agregar, no lo pide el tp pero lo dejo por las dudas
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Actualizar los datos del artículo
                //    string consultaArticulo = @"
                //UPDATE ARTICULOS
                //SET Codigo=@Codigo,
                //    Nombre=@Nombre,
                //    Descripcion=@Descripcion,
                //    Precio=@Precio,
                //    IdMarca=@IdMarca,
                //    IdCategoria=@IdCategoria
                //WHERE Id=@Id";

                string consultaArticulo = @"
            UPDATE ARTICULOS
            SET Codigo=@Codigo,
                Nombre=@Nombre,
                Descripcion=@Descripcion,
                Precio=@Precio
            WHERE Id=@Id";

                datos.setConsulta(consultaArticulo);

                datos.setearParametro("@Codigo", art.Codigo);
                datos.setearParametro("@Nombre", art.Nombre);
                datos.setearParametro("@Descripcion", art.Descripcion);
                datos.setearParametro("@Precio", art.Precio);
                //datos.setearParametro("@IdMarca", art.marca.IdMarca);
                //datos.setearParametro("@IdCategoria", art.categoria.IdCategoria);
                datos.setearParametro("@Id", art.Id);

                datos.ejecutarAccion();
                datos.cerrarConexion();

                AccesoDatos datosImg = new AccesoDatos();

                // Actualizar la URL de la imagen principal si existe (tengo dudas como actualizar una url que no sea la principal)
                //if (art.imagen != null && art.imagen.IdImagen > 0)
                //{
                //    string consultaImagen = @"
                //UPDATE IMAGENES
                //SET ImagenUrl=@ImagenUrl
                //WHERE Id=@IdImagen AND IdArticulo=@IdArticulo";

                //    datosImg.setConsulta(consultaImagen);
                //    datosImg.setearParametro("@ImagenUrl", art.imagen.ImagenUrl);
                //    datosImg.setearParametro("@IdImagen", art.imagen.IdImagen);
                //    datosImg.setearParametro("@IdArticulo", art.IdArticulo);

                //    datosImg.ejecutarAccion();
                //    datosImg.cerrarConexion();
                //}

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();

            }
        }

    }
}
