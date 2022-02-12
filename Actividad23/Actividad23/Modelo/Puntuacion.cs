using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Actividad23.Modelo
{
    public class Puntuacion
    {
        public string nombre { get; set; }
        public string tiempo { get; set; }
        public int fallos { get; set; }
        public int aciertos { get; set; }

        public Puntuacion(string nombre, string tiempo, int fallos,int aciertos)
        {
            this.nombre = nombre;
            this.tiempo = tiempo;
            this.fallos = fallos;
            this.aciertos = aciertos;
        }
    }
}