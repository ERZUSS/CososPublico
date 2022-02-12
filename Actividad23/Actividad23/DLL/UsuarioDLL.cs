using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Actividad23.DLL;
using Actividad23.Modelo;


namespace Actividad23.DLL
{   
    public class UsuarioDLL
    {
        Conexion conexion;

        public UsuarioDLL()
        {
            conexion = new Conexion();
        }

        public int agregar(Usuario usuario)
        {
            SqlCommand sentencia = new SqlCommand("Select nombre from dbo.usuario where nombre = '"+usuario.nombre+"'");
            DataSet usuariosBD = conexion.EjecutarSentencia(sentencia);
            if(usuariosBD.Tables[0].Rows.Count > 0)
            {
                return 1;
            }
            else
            {
                if (conexion.EjecutarComandoSinRetornarDatos("INSERT INTO dbo.usuario(nombre,contrasenna) values ('" + usuario.nombre + "','" + usuario.contrasenna + "') "))
                {
                    return 0;
                }
            }
            return 2;
        }
        public int comprobarUsuario(Usuario usuario)
        {
            try
            {
                SqlCommand sentencia = new SqlCommand("Select nombre from dbo.usuario where contrasenna = '" + usuario.contrasenna + "'");
                DataSet usuarioBD = conexion.EjecutarSentencia(sentencia);
                if (usuarioBD.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < usuarioBD.Tables[0].Rows.Count; i++)
                    {
                        if (usuarioBD.Tables[0].Rows[i]["nombre"].ToString() == usuario.nombre)
                        {
                            return 0;
                        }
                    }
                }
                return 1;
            }
            catch(Exception e)
            {
                return 2;
            }
        }

    }
}