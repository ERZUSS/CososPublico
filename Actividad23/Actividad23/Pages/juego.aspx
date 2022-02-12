<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="juego.aspx.cs" Inherits="Actividad23.Pages.juego" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script src="../Scripts/juego.js"></script>--%>

    <h1 class="text-center">Juegito cartas D:</h1>
    <div class="cronometro">
      <div>
          <p id="hms">00:00:00</p>
      </div>
    </div>
    <div class="row estadisticas">
        <div class="col-md-4">
            <div>
                <img src="../Imagenes/usuario.png" />
                <label id="nombreUsuario" class="prueba3" runat="server"></label>
            </div>
        </div>
        <div class="col-md-4">
            <p>Fallos</p>
            <p id="fallos"></p>
        </div>
        <div class="col-md-4">
            <p>Aciertos</p>
            <p id="aciertos">&#128176; 0</p>
        </div>
    </div>
    <div class="text-center wh100">
        <div class="victoria"></div>
    </div>
    <div class="containerMain wh100"></div>
    
    <div>
        <asp:TextBox ID="tiempoInput" runat="server"></asp:TextBox> 
        <asp:TextBox ID="fallosInput" runat="server"></asp:TextBox> 
        <asp:TextBox ID="aciertosInput" runat="server"></asp:TextBox> 
    </div>
    
    <script>
        window.addEventListener('load', main)

        let cartas = [];
        let primero = true;
        let cartaComprobada;
        let aNumerosRandom = []
        let vidas = 5;
        let fallos = 0;
        let aciertos = 0;
        let lAciertos;
        let lFallos;
        let btnReiniciar;
        let containerMain;
        let h = 0;
        let m = 0;
        let s = 0;
        let nombreI;
        let tiempoI;
        let aciertosI;
        let fallosI;

        //Jueguito
        function main() {
            tiempoI = document.querySelector('#<%= tiempoInput.ClientID %>');
            aciertosI = document.querySelector('#<%= aciertosInput.ClientID %>');
            fallosI = document.querySelector('#<%= fallosInput.ClientID %>');
            lAciertos = document.querySelector('#aciertos');
            lFallos = document.querySelector('#fallos');
            pintarVidas()
            generarCartasAleatorias();
            tiempoI.setAttribute("hidden", true);
            aciertosI.setAttribute("hidden", true);
            fallosI.setAttribute("hidden", true);
            cronometrar();
        }
        function generarCartasAleatorias() {
            while (aNumerosRandom.length < 7) {
                let nRandom = Math.round(Math.random() * 29);
                if (aNumerosRandom.find(element => element == nRandom) == undefined) {
                    aNumerosRandom.push(nRandom);
                    generarCartas(nRandom);
                    generarCartas(nRandom);
                }
            }
        }
        function generarCartas(numero) {

            containerMain = document.querySelector(".containerMain");
            let container = document.createElement("div");
            let carta = document.createElement("div");
            let back = document.createElement("div");
            let front = document.createElement("div");

            let imgBack = document.createElement("img")
            let imgFront = document.createElement("img");

            container.setAttribute("class", "hola2");
            carta.setAttribute("class", "hola2");
            back.setAttribute("class", "hola2");
            front.setAttribute("class", "hola2");

            container.setAttribute("class", "cCartas");
            carta.setAttribute("class", "carta");
            imgBack.addEventListener("click", flip)
            imgBack.addEventListener("click", comprobarCarta)

            imgBack.setAttribute("class", "cReverso");
            front.setAttribute("class", "front");
            back.setAttribute("class", "back");

            imgBack.setAttribute("src", "../Imagenes/Cartas/reversoCarta.png");
            imgFront.setAttribute("src", "../Imagenes/Cartas/" + numero + ".png");
            imgFront.setAttribute("id", "idCarta")

            container.appendChild(carta);
            carta.appendChild(back);
            carta.appendChild(front);
            back.appendChild(imgBack);
            front.appendChild(imgFront);

            cartas.push(container);

            shuffle(cartas);
            cartas.forEach(element => {
                containerMain.appendChild(element);
            });
        }
        function comprobarCarta(e) {
            let carta = e.target.parentElement.parentElement;
            let imagen = carta.parentElement.querySelector("#idCarta");
            if (primero) {
                cartaComprobada = imagen;
                primero = false;
            }
            else {
                primero = true;
                if (cartaComprobada.getAttribute("src") == imagen.getAttribute("src")) {
                    aciertos++;
                    pintasAciertos()
                    if (aciertos == 7) {
                        document.querySelector(".victoria").innerHTML += `<p class="text-center">:D</p>`;
                        document.querySelector(".victoria").innerHTML += `<asp:Button CssClass='btn btn-primary btn-lg btn-block btnReiniciar' ID='btnGanar' runat='server' Text='Reiniciar' OnClick="crearPuntuacion"/><br>`;
                        pararCrono();
                        pintarEstadisticas();
                    }
                }
                else {
                    vidas--;
                    fallos++;
                    setTimeout(() => {
                        flipCarta(cartaComprobada);
                        flipCarta(imagen);
                        pintarVidas()
                        if (vidas == 0) {
                            document.querySelector(".victoria").innerHTML += `<p class="text-center">D:</p>`;
                            document.querySelector(".victoria").innerHTML += `<asp:Button CssClass='btn btn-primary btn-lg btn-block btnReiniciar' ID='btnPerder' runat='server' Text='Reiniciar' OnClick="crearPuntuacion"/><br>`;
                            pararCrono();
                            pintarEstadisticas();
                        }
                    }, 1500);
                }
            }
        }
        function flip(e) {
            var element = e.currentTarget.parentElement.parentElement;
            if (element.className === "carta") {
                if (element.style.transform == "rotateY(180deg)") {
                    element.style.transform = "rotateY(0deg)";
                }
                else {
                    element.style.transform = "rotateY(180deg)";
                }
            }
        }
        function flipCarta(carta) {
            var element = carta.parentElement.parentElement;
            if (element.className === "carta") {
                if (element.style.transform == "rotateY(180deg)") {
                    element.style.transform = "rotateY(0deg)";
                }
                else {
                    element.style.transform = "rotateY(180deg)";
                }
            }
        }
        function shuffle(array) {
            let currentIndex = array.length, randomIndex;

            while (currentIndex != 0) {

                randomIndex = Math.floor(Math.random() * currentIndex);
                currentIndex--;

                [array[currentIndex], array[randomIndex]] = [
                    array[randomIndex], array[currentIndex]];
            }

            return array;
        }
        function pintarVidas() {
            lFallos.innerHTML = ""
            for (let i = 0; i < vidas; i++) {
                lFallos.innerHTML += "&#128150;"
            }
        }
        function pintasAciertos() {
            lAciertos.innerHTML = `&#128176; ${aciertos} `;
        }

        //Fin jueguito

        //Cronometro
        function cronometrar() {
            escribirCrono();
            id = setInterval(escribirCrono, 1000);
        }
        function escribirCrono() {
            var hAux, mAux, sAux;
            s++;
            if (s > 59) { m++; s = 0; }
            if (m > 59) { h++; m = 0; }
            if (h > 24) { h = 0; }

            if (s < 10) { sAux = "0" + s; } else { sAux = s; }
            if (m < 10) { mAux = "0" + m; } else { mAux = m; }
            if (h < 10) { hAux = "0" + h; } else { hAux = h; }

            document.getElementById("hms").innerHTML = hAux + ":" + mAux + ":" + sAux;
        }
        function reiniciarCrono() {
            clearInterval(id);
            document.getElementById("hms").innerHTML = "00:00:00";
            h = 0; m = 0; s = 0;
        }
        function pararCrono() {
            clearInterval(id);
        }
        //Fin cronometro

        //Pintar estadisticas
        function pintarEstadisticas() {
            let segundos;
            let minutos;
            let horas;

            if (s < 10) { segundos = `0${s}` } else { segundos = `${s}` }
            if (m < 10) { minutos = `0${m}` } else { minutos = `${m}` }
            if (h < 10) { horas = `0${h}` } else { horas = `${h}` }

            tiempoI.value = `${horas}:${minutos}:${segundos}`;
            aciertosI.value = aciertos;
            fallosI.value = fallos;
        }
        //Fin estadisticas

    </script>
</asp:Content>

