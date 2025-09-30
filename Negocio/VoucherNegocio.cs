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
                datos.setConsulta("SELECT IdCliente FROM Vouchers WHERE CodigoVoucher = @codigo");
                datos.setearParametro("@codigo", codigo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    object idCliente = datos.Lector["IdCliente"];
                    datos.cerrarConexion();
                    return idCliente == DBNull.Value; // si no hay cliente asignado, se puede usar
                }

                datos.cerrarConexion();
                return false; // No existe el código
            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
            }
        }
    }
}