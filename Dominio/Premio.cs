﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_Promo_Web.Dominio
{
    public class Premio
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int idCategoria { get; set; }
        public string Categoria { get; set; }
        public int idMarca { get; set; }
        public string Marca { get; set; }
        public List<string> Imagenes { get; set; }
    }


}