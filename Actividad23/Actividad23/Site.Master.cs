using Actividad23.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Actividad23
{
    public partial class SiteMaster : MasterPage
    {
        public ServicioUsuario servicio = new ServicioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (servicio.getUsuario().nombre.Equals("Invitado"))
            {
                btnCerrarSesion.Visible = false;
            }
        }
        public void cerrarSesion(object sender, EventArgs e)
        {
            servicio.logout();
            Response.Redirect("/");
        }
    }
}