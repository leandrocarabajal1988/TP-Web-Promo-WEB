using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_Promo_Web.Datos;

namespace TP_Promo_Web.Negocio
{
    public class VoucherNegocio
    {
        public bool ValidarCodigo(string codigo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta(@"SELECT IdCliente, FechaCanje, IdArticulo 
                            FROM Vouchers 
                            WHERE CodigoVoucher = @codigo");
                datos.setearParametro("@codigo", codigo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    object idCliente = datos.Lector["IdCliente"];
                    object fechaCanje = datos.Lector["FechaCanje"];
                    object idArticulo = datos.Lector["IdArticulo"];

                    // Solo es válido si no fue usado
                    return idCliente == DBNull.Value && fechaCanje == DBNull.Value && idArticulo == DBNull.Value;
                }

                return false; // no existe el código
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


        public void AsignarClienteAVoucher(string codigoVoucher, int idCliente, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = @"UPDATE Vouchers 
                            SET IdCliente = @idCliente, 
                                FechaCanje = GETDATE(), 
                                IdArticulo = @idArticulo 
                            WHERE CodigoVoucher = @codigo";

                datos.setConsulta(consulta);
                datos.setearParametro("@idCliente", idCliente);
                datos.setearParametro("@idArticulo", idArticulo);
                datos.setearParametro("@codigo", codigoVoucher);
                datos.ejecutarAccion();
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