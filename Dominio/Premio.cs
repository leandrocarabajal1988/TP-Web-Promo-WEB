using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_Promo_Web.Dominio
{
    public class Premio
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public List<string> Imagenes { get; set; }
    }

}