/*/*window.addEventListener('load', main)*/*/
let cartas = [];
let primero = true;
let cartaComprobada;
let acertado = 0;
let aNumerosRandom = []


function main() {
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

    let containerMain = document.querySelector(".containerMain");
    let container = document.createElement("div");
    let carta = document.createElement("div");
    let back = document.createElement("div");
    let front = document.createElement("div");

    let imgBack = document.createElement("img")
    let imgFront = document.createElement("img");

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
        if (cartaComprobada.getAttribute("src") === imagen.getAttribute("src")) {
            acertado++;
            if (acertado == 7) {
                document.querySelector(".victoria").innerHTML = "Has ganado :D";
            }
        }
        else {
            setTimeout(() => {
                flipCarta(cartaComprobada);
                flipCarta(imagen);
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