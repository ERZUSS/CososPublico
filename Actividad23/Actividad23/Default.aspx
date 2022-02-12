<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Actividad23._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContenedor">
        <img class="isaac" src="Imagenes/Personaje/FRENTE.png" alt="">
        <!-- <img class="isaac" src="link.png" alt=""> -->

        <div id="idLink" class="link">
        </div>
        <div id="idEspada" class="espada">
            <img src="Imagenes/espadaEspiritu.png" />
        </div>
        <div id="idPuertaILogin" class="puertaILogin"></div>
        <div id="idTelePuntuacion" class="telePuntuacion"></div>
        <div id="idPuertaDRegistro" class="puertaDRegistro"></div>
        <div id="idSofaJuego" class="sofaJuego"></div>
    </div>

    <script>
        window.addEventListener('load', main);

        let imgIssac;
        let espadaPedestal = true;

        // MOVIMIENTO
        const MOV = 1;
        const SALTO = 1;
        let paso = 1;
        let salto = false

        // COORDENADAS INICIALES
        let x = 50
        let y = 50


        function eventos() {
            evento("#idTelePuntuacion", irPuntuaciones);
            evento("#idPuertaILogin", irLogin);
            evento("#idPuertaDRegistro", irRegistrar);
            evento("#idSofaJuego", irJuego);
            evento("#idEspada", verLink);
        }
        function irPuntuaciones() { window.location.href = "/Pages/puntuacion" }
        function irLogin() { window.location.href = "/Pages/login" }
        function irRegistrar() { window.location.href = "/Pages/registrar" }
        function irJuego() { window.location.href = "/Pages/juego" }
        function verLink() {
            if (espadaPedestal) {
                let imgLink = document.createElement("img");
                let divImgLink = document.querySelector("#idLink");
                imgLink.setAttribute("src", "Imagenes/link.png");
                divImgLink.appendChild(imgLink);
                document.querySelector("#idEspada").firstElementChild.setAttribute("src", "Imagenes/pedestal.png");
                espadaPedestal = false;
            }
            else {
                let divImgLink = document.querySelector("#idLink");
                divImgLink.firstElementChild.remove();
                document.querySelector("#idEspada").firstElementChild.setAttribute("src", "Imagenes/espadaEspiritu.png");
                espadaPedestal = true;
            }

        }
        // INICIO
        function main() {
            imgIssac = document.querySelector(".isaac");
            document.addEventListener('keydown', event => {
                if (!salto) {
                    switch (event.code) {
                        case "ArrowUp": mover("ARR"); if (y + MOV > 14) y -= MOV; break;
                        case "ArrowRight": mover("DER"); if (x + MOV < 77) x += MOV; break;
                        case "ArrowDown": mover("ABA"); if (y - MOV < 88) y += MOV; break;
                        case "ArrowLeft": mover("IZQ"); if (x - MOV > 19) x -= MOV; break;
                        case "Space": saltar(); break;
                    }
                }
            });
        }

        // FUNCIONES DE MOVIMIENTO
        function saltar() {
            y -= SALTO;
            salto = true;

            imgIssac.setAttribute("src", "Imagenes/Personaje/SALTO.png");
            imgIssac.setAttribute("style", `top:${y}vh;left:${x}vw;`);

            setTimeout(() => {
                y += SALTO
                imgIssac.setAttribute("src", "Imagenes/Personaje/FRENTE.png")
                imgIssac.setAttribute("style", `top:${y}vh;left:${x}vw;`);
                salto = false

                eventos()
            }, 300);
        }
        function mover(direccion) {
            if (paso == 1) {
                imgIssac.setAttribute("src", `Imagenes/Personaje/${direccion}_2.png`);
                paso = 2;
            }
            else {
                imgIssac.setAttribute("src", `Imagenes/Personaje/${direccion}_1.png`);
                paso = 1;
            }
            imgIssac.setAttribute("style", `top:${y}vh;left:${x}vw;`);
        }

        // COMPROBAR QUE EL PERSONAJE ESTE EN RANGO
        function enRango(coordX, coordY, rango) {
            coordX = coordX + rango / 2;
            coordY = coordY + rango / 2;
            let izquierda = coordX - rango;
            let derecha = coordX + rango;
            let arriba = coordY - rango;
            let abajo = coordY + rango;

            let isaacY = imgIssac.offsetTop;
            let isaacX = imgIssac.offsetLeft;

            let estaHorizontal = isaacX > izquierda && isaacX < derecha;
            let estaVertical = isaacY > arriba && isaacY < abajo;

            if (estaHorizontal && estaVertical) { return true; }
            else { return false; }
        }

        // EJECUTOR DE EVENTOS
        function evento(id, funcion) {
            let elemento = document.querySelector(id);
            let coordY = elemento.offsetTop;
            let coordX = elemento.offsetLeft;
            let rango = elemento.offsetWidth;
            if (enRango(coordX, coordY, rango)) { funcion(); }
        }


    </script>
</asp:Content>
