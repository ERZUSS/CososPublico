using Actividad23.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Actividad23.DLL
{
    public class PuntuacionDLL
    {
        Conexion conexion;
        public PuntuacionDLL()
        {
            conexion = new Conexion();
        }

        public bool agregar(Puntuacion puntuacion)
        {
            if (conexion.EjecutarComandoSinRetornarDatos("INSERT INTO dbo.estadisticas(nombre,tiempo,fallos,aciertos) values ('" + puntuacion.nombre + "','" + puntuacion.tiempo + "','" + puntuacion.fallos + "','" + puntuacion.aciertos + "') "))
            {
                return true;
            }
            return false;
        }
        public DataSet obtenerPuntuaciones()
        {
            SqlCommand sentencia = new SqlCommand("Select * from dbo.estadisticas ORDER BY tiempo ASC");
            DataSet usuarioBD = conexion.EjecutarSentencia(sentencia);
            if(usuarioBD.Tables[0].Rows.Count > 0)
            {
                return usuarioBD;
            }
            return null;
        }
    }
}