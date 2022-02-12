using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Actividad23.DLL;
using Actividad23.Modelo;

namespace Actividad23.Pages
{
    public partial class login : System.Web.UI.Page
    {
        UsuarioDLL addUsuario;
        ServicioUsuario servicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            servicio = new ServicioUsuario();
        }
        public void loguear(object sender, EventArgs e)
        {
            if (iNombreL.Text.Equals("") || iContrasennaL.Text.Equals(""))
            {
                lValidacionL.Text = "Todos los campos son obligatorios";
            }
            else
            {
                addUsuario = new UsuarioDLL();
                Usuario usuario = new Usuario(iNombreL.Text, iContrasennaL.Text);
                switch (addUsuario.comprobarUsuario(usuario))
                {
                    case 0:
                        servicio.setUsuario(usuario);
                        lValidacionLCorrecto.Text = "Logueado correctamente";
                        Response.Redirect("juego.aspx");
                        break;
                    case 1:
                        lValidacionL.Text = "Usuario o contraseña incorrecta";
                        break;
                    case 2:
                        lValidacionL.Text = "Fallo del servidor";
                        break;
                }
            }
        }
        public void goRegistro(object sender, EventArgs e)
        {
            Response.Redirect("registrar.aspx");
        }
    }
}