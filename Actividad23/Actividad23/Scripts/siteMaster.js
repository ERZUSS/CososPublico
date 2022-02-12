window.addEventListener('load', main);
menuOculto = true;
function main() {
    document.querySelector(".ocultarMenu").addEventListener("click",ocultarMenu)
}
function ocultarMenu() {
    if (menuOculto) {
        document.querySelector("#divMenuOculto").style.display = "block";
        menuOculto = false;
    }
    else {
        document.querySelector("#divMenuOculto").style.display = "none";
        menuOculto = true;
    }
}