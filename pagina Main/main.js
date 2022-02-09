window.addEventListener('load', main);

let imgIssac;

// MOVIMIENTO
const MOV = 1;
const SALTO = 1;
let paso = 1;
let salto = false

// COORDENADAS INICIALES
let x = 50
let y = 50

// INICIO
function main() {
    imgIssac = document.querySelector(".isaac");
    document.addEventListener('keydown', event => {
        if (!salto) {
            switch (event.code) {
                case "ArrowUp": mover("ARR"); y -= MOV; break;
                case "ArrowRight": mover("DER"); x += MOV; break;
                case "ArrowDown": mover("ABA"); y += MOV; break;
                case "ArrowLeft": mover("IZQ"); x -= MOV; break;
                case "Space": saltar(); break;
            }
        }
    });
}

// FUNCIONES DE MOVIMIENTO
function saltar() {
    y -= SALTO;
    salto = true;

    imgIssac.setAttribute("src", "img/SALTO.png");
    imgIssac.setAttribute("style", `top:${y}vh;left:${x}vw;`);

    setTimeout(() => {
        y += SALTO
        imgIssac.setAttribute("src", "img/FRENTE.png")
        imgIssac.setAttribute("style", `top:${y}vh;left:${x}vw;`);
        salto = false

        evento("id1", evento1);
        evento("id2", evento2);
    }, 300);
}
function mover(direccion) {
    if (paso == 1) {
        imgIssac.setAttribute("src", `img/${direccion}_2.png`);
        paso = 2;
    } 
    else {
        imgIssac.setAttribute("src", `img/${direccion}_1.png`);
        paso = 1;
    }
    imgIssac.setAttribute("style", `top:${y}vh;left:${x}vw;`);
}

// COMPROBAR QUE EL PERSONAJE ESTE EN RANGO
function enRango(coordX, coordY, rango) {
    coordX = coordX + rango/2;
    coordY = coordY + rango/2;
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
    let elemento = document.querySelector("#"+id);
    let coordY = elemento.offsetTop;
    let coordX = elemento.offsetLeft;
    let rango = elemento.offsetWidth;
    if (enRango(coordX, coordY, rango)) { funcion(); }
}

// EVENTOS
function evento1() { alert("Evento 1"); }
function evento2() { alert("Evento 2"); }