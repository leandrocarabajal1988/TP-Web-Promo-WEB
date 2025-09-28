using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_Promo_Web.Dominio
{
    public class Cliente
    {
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Pais { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }
        public string CP { get; set; }
        public string Telefono { get; set; }
    }

}