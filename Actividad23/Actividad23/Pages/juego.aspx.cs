using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Actividad23.Modelo;
using Actividad23.DLL;

namespace Actividad23.Pages
{
    public partial class juego : System.Web.UI.Page
    {
        ServicioUsuario servicio = new ServicioUsuario();
        Puntuacion puntuacion;
        PuntuacionDLL puntuacionDll = new PuntuacionDLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            nombreUsuario.InnerHtml = servicio.getUsuario().nombre;
        }
        public void crearPuntuacion(object sender, EventArgs e)
        {
            string nombre = servicio.getUsuario().nombre;
            string tiempo = tiempoInput.Text;
            int fallos = int.Parse(fallosInput.Text);
            int aciertos = int.Parse(aciertosInput.Text);
            puntuacion = new Puntuacion(nombre,tiempo ,fallos , aciertos);
            if (puntuacionDll.agregar(puntuacion))
            {
                Console.WriteLine("guardado correctamente");
            }
            else
            {
                Console.WriteLine("F");
            }
        }
    }
}