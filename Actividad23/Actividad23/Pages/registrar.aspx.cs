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
    public partial class registrar : System.Web.UI.Page
    {
        UsuarioDLL addUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void goLogin(object sender,EventArgs e)
        {
            Response.Redirect("Pages/login.aspx");
        }
        public void crearUsuario(object sender, EventArgs e)
        {
            if(iNombreR.Text.Equals("") || iContrasennaR.Text.Equals("") || iContrasenna2R.Text.Equals(""))
            {
                lValidacion.Text = "Todos los campos son obligatorios";
            }
            else
            {
                if (!iContrasennaR.Text.Equals(iContrasenna2R.Text))
                {
                    lValidacion.Text = "Las constraseñas no son correctas";

                }
                else
                {
                    addUsuario = new UsuarioDLL();
                    Usuario usuario = new Usuario(iNombreR.Text, iContrasennaR.Text);
                    switch(addUsuario.agregar(usuario)){
                        case 0:
                            lValidacion.Text = "";
                            lValidacionCorrecto.Text = "Usuario creado correctamente.";
                            break;
                        case 1:
                            lValidacion.Text = "Usuario ya registrado";
                            lValidacionCorrecto.Text = "";
                            break;
                        case 2:
                            lValidacion.Text = "Error del servidor :(";
                            lValidacionCorrecto.Text = "";
                            break;
                    }

                }
            }
            
        }

    }
}