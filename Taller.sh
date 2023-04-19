#!/bin/bash
 function menu(){
    echo "Seleccione una opcion"
    echo "1) Ver procesos en ejecucion"
    echo "2) Matar un proceso"
    echo "3) Ver el estado del almacenamiento"
    echo "4) Ver tamaño de un directorio o archivo"
    echo "5) Generar un reporte"
    echo "6) Terminar programa" 
 }


function killProces() {
  read -p "Ingrese el PID del proceso  a matar: " pid
  kill -9 "$pid"
  if [[ $? -eq 0 ]]; then
    echo "El proceso con PID $pid ha sido terminado" 
  else 
    mkdir logs
    $? > logs/errorLog.txt
    echo "No se pudo finalizar el proceso, por favor verifique los logs"  
  fi
}

while [ "$option" -eq 0 ]; do
  menu
  read option
    case $option in 
      "1")
        ;;
      "2") killProces
        ;;
      "3")
        ;;
      "4")
        ;; 
    esac  
done
     










