#!/bin/bash
function menu() {
  echo "Seleccione una opcion"
  echo "1) Ver procesos en ejecucion"
  echo "2) Matar un proceso"
  echo "3) Ver el estado del almacenamiento"
  echo "4) Ver tamaño de un directorio o archivo"
  echo "5) Generar un reporte"
  echo "6) Terminar programa"
  echo "7) Salir"
}

function killProces() {
  read -p "Ingrese el PID del proceso  a matar: " pid
  kill -9 "$pid"
  if [[ $? -eq 0 ]]; then
    echo "El proceso con PID $pid ha sido terminado"
  else
    mkdir logs
    $? >logs/errorLog.txt
    echo "No se pudo finalizar el proceso, por favor verifique los logs"
  fi
}
function verEstadoDelAlmacenamiento() {
  echo df -h
}
function verTamañoDeUnDirectorioOArchivo() {
  read -p "Ingrese el directorio o archivo a verificar: " dir
  if [ -d dir ]; then
    echo "El directorio $dir existe"
  fi
  echo du -h "$dir"
}
function generarUnReporte() {
  echo "Generar un reporte"
  if [[ ! -d "reports" ]]; then
    mkdir reports
  fi
  echo "$1" > reports/"$2".txt
}
function terminarPrograma() {
  echo "Terminar programa"
  exit 0
}
informacionDeMemoria() {
  echo "Memoria"
  echo "Memoria total: $(free -h | grep Mem | awk '{print $2}')"
  echo "Memoria libre: $(free -h | grep Mem | awk '{print $4}')"
  echo "Memoria usada: $(free -h | grep Mem | awk '{print $3}')"
  echo "Memoria compartida: $(free -h | grep Mem | awk '{print $5}')"
  echo "Memoria en buffer: $(free -h | grep Mem | awk '{print $6}')"
  echo "Memoria en cache: $(free -h | grep Mem | awk '{print $7}')"
  echo "Memoria disponible: $(free -h | grep Mem | awk '{print $7}')"
}
while [ "$option" -eq 0 ]; do
  menu
  read option
  case $option in
  "1") ;;
  "2")
    killProces
    ;;
  "3") 
  verEstadoDelAlmacenamiento
  ;;
  "4") 
  
  ;;
  "5")
  ;;
  "6")
  ;;
  "7")
  terminarPrograma
  ;;
  esac
done
