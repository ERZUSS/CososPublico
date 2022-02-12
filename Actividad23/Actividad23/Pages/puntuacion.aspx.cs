using Actividad23.DLL;
using Actividad23.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Actividad23.Pages
{
    public partial class puntuacion : System.Web.UI.Page
    {
        PuntuacionDLL puntuacionDll = new PuntuacionDLL();
        List<Puntuacion> puntuacionesList = new List<Puntuacion>();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet puntuaciones = puntuacionDll.obtenerPuntuaciones();
            if (puntuaciones != null)
            {
                for(int i = 0; i < puntuaciones.Tables[0].Rows.Count; i++)
                {
                    puntuacionesList.Add(new Puntuacion(
                            puntuaciones.Tables[0].Rows[i]["nombre"].ToString(),
                            puntuaciones.Tables[0].Rows[i]["tiempo"].ToString(),
                            int.Parse(puntuaciones.Tables[0].Rows[i]["fallos"].ToString()),
                            int.Parse(puntuaciones.Tables[0].Rows[i]["aciertos"].ToString())));
                }
            }
            TableRow fila1 = new TableRow();

            TableCell cNombre1 = new TableCell();
            TableCell cTiempo1 = new TableCell();
            TableCell cFallos1 = new TableCell();
            TableCell cAciertos1 = new TableCell();

            cNombre1.Controls.Add(new LiteralControl("Nombre"));
            cTiempo1.Controls.Add(new LiteralControl("Tiempo"));
            cFallos1.Controls.Add(new LiteralControl("Fallos"));
            cAciertos1.Controls.Add(new LiteralControl("Aciertos"));

            fila1.Cells.Add(cNombre1);
            fila1.Cells.Add(cTiempo1);
            fila1.Cells.Add(cFallos1);
            fila1.Cells.Add(cAciertos1);

            Table1.Rows.Add(fila1);


            foreach (Puntuacion p in puntuacionesList)
            {
                TableRow fila = new TableRow();

                TableCell cNombre = new TableCell();
                TableCell cTiempo = new TableCell();
                TableCell cFallos = new TableCell();
                TableCell cAciertos = new TableCell();

                cNombre.Controls.Add(new LiteralControl(p.nombre));
                cTiempo.Controls.Add(new LiteralControl(p.tiempo));
                cFallos.Controls.Add(new LiteralControl(p.fallos.ToString()));
                cAciertos.Controls.Add(new LiteralControl(p.aciertos.ToString()));

                fila.Cells.Add(cNombre);
                fila.Cells.Add(cTiempo);
                fila.Cells.Add(cFallos);
                fila.Cells.Add(cAciertos);

                Table1.Rows.Add(fila);
            }
        }
    }
}