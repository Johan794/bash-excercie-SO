#!/bin/bash
 function menu(){
    echo "Seleccione una opcion"
    echo "1) Ver procesos en ejecucion"
    echo "2) Matar un proceso"
    echo "3) Ver el estado del almacenamiento"
    echo "4) Ver tamaño de un directorio o archivo"
    echo "5) Terminar programa" 
 }


function killProces() {
  read -p "Ingrese el PID del proceso a matar: " pid
  kill "$pid"
  if [[ $? -eq 0 ]]; then
    echo "El proceso con PID $pid ha sido matado"
}

menu()


