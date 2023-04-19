#!/bin/bash
function menu() {
  echo "Seleccione una opcion"
  echo "1) Ver procesos en ejecucion"
  echo "2) Matar un proceso"
  echo "3) Ver el estado del almacenamiento"
  echo "4) Ver informacion de memoria"
  echo "5) Ver tamaño de un directorio o archivo"
  echo "6) Generar un reporte"
  echo "7) Terminar "
  echo "8) Salir"
}

# show process information
function verProcesosEnEjecucion() {
  echo "Procesos en ejecucion"
  echo ps -aux
}
# kill process
function killProces() {
  verProcesosEnEjecucion
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
# show disk information
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
  echo "$1" >reports/"$2".txt
}
function terminarPrograma() {
  echo "Terminar programa"
  exit 0
}
# show memory information
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
# show disk information
informacionDeDisco() {
  echo "Disco"
  echo "Espacio total: $(df -h | grep /dev/sda1 | awk '{print $2}')"
  echo "Espacio usado: $(df -h | grep /dev/sda1 | awk '{print $3}')"
  echo "Espacio libre: $(df -h | grep /dev/sda1 | awk '{print $4}')"
  echo "Espacio usado porcentual: $(df -h | grep /dev/sda1 | awk '{print $5}')"
  echo "Punto de montaje: $(df -h | grep /dev/sda1 | awk '{print $6}')"
}
# show load information
informacionDeCarga() {
  echo "Carga"
  echo "Carga promedio de 1 minuto: $(uptime | awk '{print $10}')"
  echo "Carga promedio de 5 minutos: $(uptime | awk '{print $11}')"
  echo "Carga promedio de 15 minutos: $(uptime | awk '{print $12}')"
}
# show process information
informacionDeProcesos() {
  echo "Procesos"
  echo "Procesos en ejecucion: $(ps -A | wc -l)"
  echo "Procesos en ejecucion de usuario: $(ps -u | wc -l)"
  echo "Procesos en ejecucion de root: $(ps -u root | wc -l)"
}
informacionDeUsuarios() {
  echo "Usuarios"
  echo "Usuarios conectados: $(who | wc -l)"
  echo "Usuarios conectados actualmente: $(who | wc -l)"
  echo "Usuarios conectados en el ultimo minuto: $(who | wc -l)"
  echo "Usuarios conectados en el ultimo 5 minutos: $(who | wc -l)"
  echo "Usuarios conectados en el ultimo 15 minutos: $(who | wc -l)"
}
value=$(expr $option + 0)
while [ "$value" -eq 0 ]; do
  menu
  read option
  case $option in
  "1") ;;
  "2")
    killProces
    ;;
  "3")
    informacionDeDisco
    ;;
  "4")
    informacionDeMemoria
    ;;
  "5")
    verTamañoDeUnDirectorioOArchivo
    ;;
  "6") ;;
  "8")
    terminarPrograma
    ;;
  esac
done
