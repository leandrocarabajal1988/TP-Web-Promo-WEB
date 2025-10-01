using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP_Promo_Web.Datos;
using TP_Promo_Web.Dominio;

namespace TP_Promo_Web.Negocio
{
    public class ClienteNegocio
    {
        public Cliente BuscarPorDNI(string dni)
        {
            AccesoDatos datos = new AccesoDatos();
            Cliente cliente = null;

            try
            {
                datos.setConsulta("SELECT Nombre, Apellido, Email, Pais, Direccion, Ciudad, CP, Telefono FROM Clientes WHERE DNI = @DNI");
                datos.setearParametro("@DNI", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    cliente = new Cliente
                    {
                        DNI = dni,
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Apellido = datos.Lector["Apellido"].ToString(),
                        Email = datos.Lector["Email"].ToString(),
                        Pais = datos.Lector["Pais"].ToString(),
                        Direccion = datos.Lector["Direccion"].ToString(),
                        Ciudad = datos.Lector["Ciudad"].ToString(),
                        CP = datos.Lector["CP"].ToString(),
                        Telefono = datos.Lector["Telefono"].ToString()
                    };
                }
            }
            finally
            {
                datos.cerrarConexion();
            }

            return cliente;
        }

        public void Guardar(Cliente cliente)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("INSERT INTO Clientes (DNI, Nombre, Apellido, Email, Pais, Direccion, Ciudad, CP, Telefono) VALUES (@DNI, @Nombre, @Apellido, @Email, @Pais, @Direccion, @Ciudad, @CP, @Telefono)");
                datos.setearParametro("@DNI", cliente.DNI);
                datos.setearParametro("@Nombre", cliente.Nombre);
                datos.setearParametro("@Apellido", cliente.Apellido);
                datos.setearParametro("@Email", cliente.Email);
                datos.setearParametro("@Pais", cliente.Pais);
                datos.setearParametro("@Direccion", cliente.Direccion);
                datos.setearParametro("@Ciudad", cliente.Ciudad);
                datos.setearParametro("@CP", cliente.CP);
                datos.setearParametro("@Telefono", cliente.Telefono);
                datos.ejecutarAccion();
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
