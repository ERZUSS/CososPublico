using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Actividad23.Modelo
{
    public class ServicioUsuario
    {
        static Usuario usuarioActivo = new Usuario("Invitado", "Invitado");
        public ServicioUsuario() {
        }

        public void setUsuario(Usuario usuario)
        {
            usuarioActivo = usuario;
        }
        public Usuario getUsuario()
        {
            return usuarioActivo;
        }
        public void logout()
        {
            if (!usuarioActivo.nombre.Equals("Invitado"))
            {
                setUsuario(new Usuario("Invitado", "Invitado"));
            }
        }

    }
}