#!/bin/bash

# Función para mostrar la imagen ASCII y el menú
mostrar_menu() {
  clear
  echo -n -e "
  
                ▓░    ▒ ▓▓▓ ▓   ▓░▒               
             ▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓   ▒▒▓▓            
           ▒▓▓▓   ▒▓▓▓▓▓▓▓▓▓▓▓▓ ▓   ▒▓▓▓          
         ▒▓▓▓     ░▓▓▓▓▓▓▓▓▓▓▓▓▓▒     ▓▓▓▓        
     ▒▓▒▓▓▓▓      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ▓▓▓▓▓▓▓    
    ▓▒░▓▓▓▓       ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓▓ ▓▓░  
  ░▓▒ ▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒        ▓▓▓▓▓▓░░ 
  ▓▓▓▒▓▓▒▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓        ▓▓▓▓▓▒▓▓ 
 ▓▓▓░▓▓▓▓▓▓▒▓     ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓     ▓▓▓▓▓▓▓ ▓▓▓▓
 ▓▓▓   ▓▓▓▓▓▓▓▓    ▒▓▓▓▓▓▓▓▓▓▓▓▓   ▒▓▓▓▓▓▓▓▓   ▓▓▓
 ▓▓▓▒▒   ▒ ▓▓▓▓▓▒▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓    ▓▒▓▓▓
 ░▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓
    ▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▓    
            ▒▒▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒           
        ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓░▓        
░ ▓▓▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓ 
▓▓▓▓▓▓▒▒▒░   ▓▓▓▓▓▒▓▒▓▓▓▓▓▓▓▓ ░▓▓▓▓▓▓▒   ▓▓▒▓▓▓▓▓▓
 ▓▓▒       ▒▓▓▓▓▓░   ░▓▓▓▓▓▓▓░▓  ▒▓▓▓▓▓░       ░▓▓
▓▓▓▓    ▓▒▓▓▓ ▓       ▓▓▓▓▓▓░       ▒▓▓▓▓▓▒    ▒▓▓
 ▓▓▓▓ ░▓▓▓▓▓▓        ░▓▓▒ ▒▓░         ▒▓▓▓▓▓  ▓▓▓▓
  ▓▓▓  ▓▓▓▓▒           ▒▒ ▓▒           ░▓▓▓▓ ░ ▓░ 
  ░▓▓▓  ▓▓▓▓                           ▓▓▓▒  ▓▓▓  
    ▓▓   ▒▓▓▓                         ▓▓▓▓  ▓▓▓   
     ▓▓▒  ▓▓▓▒                       ▒▓▓▒  ▓▒░    
           ▓▓▓▓                     ▓▓▓▓          
             ▓▓▓▓                 ░▓▓▓            
               ▓▒▓▒            ▒▓▓▓▓                                            By:Gasxyz      \n"
           
  echo "1. MRU (Movimiento Rectilíneo Uniforme)"
  echo "2. MRUV (Movimiento Rectilíneo Uniformemente Variado)"
  echo "3. Cambiar unidades"
  echo "4. Salir"
  echo ""
  read -p "Elija una opción: " opcion
}

# Función para validar que una entrada es numérica
es_numerico() {
  [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
}

# Función para convertir comas a puntos en los valores numéricos
convertir_comas_a_puntos() {
  echo "$1" | tr ',' '.'
}

# Función para redondear números a dos decimales
redondear() {
  printf "%.2f\n" "$1"
}

# Función para convertir unidades
convertir_unidades() {
  echo "Conversión de unidades"
  echo "Seleccione la unidad de entrada y salida:"
  echo "1. Metros a Kilómetros"
  echo "2. Kilómetros a Metros"
  echo "3. Segundos a Minutos"
  echo "4. Minutos a Segundos"
  echo "5. Cancelar"
  read -p "Elija una opción: " unidad_opcion

  case $unidad_opcion in
    1)
      read -p "Introduzca el valor en metros: " metros
      metros=$(convertir_comas_a_puntos "$metros")
      if es_numerico "$metros"; then
        kilometros=$(echo "$metros / 1000" | bc -l)
        echo "Valor en kilómetros: $(redondear "$kilometros") km"
      else
        echo "Error: Debe proporcionar un valor numérico."
      fi
      ;;
    2)
      read -p "Introduzca el valor en kilómetros: " kilometros
      kilometros=$(convertir_comas_a_puntos "$kilometros")
      if es_numerico "$kilometros"; then
        metros=$(echo "$kilometros * 1000" | bc -l)
        echo "Valor en metros: $(redondear "$metros") m"
      else
        echo "Error: Debe proporcionar un valor numérico."
      fi
      ;;
    3)
      read -p "Introduzca el valor en segundos: " segundos
      segundos=$(convertir_comas_a_puntos "$segundos")
      if es_numerico "$segundos"; then
        minutos=$(echo "$segundos / 60" | bc -l)
        echo "Valor en minutos: $(redondear "$minutos") min"
      else
        echo "Error: Debe proporcionar un valor numérico."
      fi
      ;;
    4)
      read -p "Introduzca el valor en minutos: " minutos
      minutos=$(convertir_comas_a_puntos "$minutos")
      if es_numerico "$minutos"; then
        segundos=$(echo "$minutos * 60" | bc -l)
        echo "Valor en segundos: $(redondear "$segundos") s"
      else
        echo "Error: Debe proporcionar un valor numérico."
      fi
      ;;
    5)
      echo "Conversión cancelada."
      ;;
    *)
      echo "Opción no válida. Intente nuevamente."
      ;;
  esac
}

# Función para resolver MRU
resolver_mru() {
  echo "Movimiento Rectilíneo Uniforme (MRU)"
  read -p "Introduzca la velocidad (v) [m/s]: " v
  v=$(convertir_comas_a_puntos "$v")
  read -p "Introduzca el tiempo (t) [s]: " t
  t=$(convertir_comas_a_puntos "$t")
  read -p "Introduzca la distancia (d) [m]: " d
  d=$(convertir_comas_a_puntos "$d")

  if [ -z "$d" ]; then
    if es_numerico "$v" && es_numerico "$t"; then
      d=$(echo "$v * $t" | bc -l)
      echo "Distancia (d) calculada: $(redondear "$d") m"
    else
      echo "Error: Debe proporcionar valores numéricos para velocidad y tiempo."
    fi
  elif [ -z "$v" ];then
    if es_numerico "$d" && es_numerico "$t"; then
      v=$(echo "$d / $t" | bc -l)
      echo "Velocidad (v) calculada: $(redondear "$v") m/s"
    else
      echo "Error: Debe proporcionar valores numéricos para distancia y tiempo."
    fi
  elif [ -z "$t" ]; then
    if es_numerico "$d" && es_numerico "$v"; then
      t=$(echo "$d / $v" | bc -l)
      echo "Tiempo (t) calculado: $(redondear "$t") s"
    else
            echo "Error: Debe proporcionar valores numéricos para distancia y velocidad."
    fi
  else
    echo "Todos los valores fueron ingresados. No hay incógnitas que resolver."
  fi
}

# Función para resolver MRUV
resolver_mruv() {
  echo "Movimiento Rectilíneo Uniformemente Variado (MRUV)"
  read -p "Introduzca la velocidad inicial (v0) [m/s]: " v0
  v0=$(convertir_comas_a_puntos "$v0")
  read -p "Introduzca la velocidad final (vf) [m/s]: " vf
  vf=$(convertir_comas_a_puntos "$vf")
  read -p "Introduzca la aceleración (a) [m/s²]: " a
  a=$(convertir_comas_a_puntos "$a")
  read -p "Introduzca el tiempo (t) [s]: " t
  t=$(convertir_comas_a_puntos "$t")
  read -p "Introduzca la distancia (d) [m]: " d
  d=$(convertir_comas_a_puntos "$d")

  if [ -z "$vf" ]; then
    if es_numerico "$v0" && es_numerico "$a" && es_numerico "$t"; then
      vf=$(echo "$v0 + $a * $t" | bc -l)
      echo "Velocidad final (vf) calculada: $(redondear "$vf") m/s"
    else
      echo "Error: Debe proporcionar valores numéricos para velocidad inicial, aceleración y tiempo."
    fi
  elif [ -z "$v0" ]; then
    if es_numerico "$vf" && es_numerico "$a" && es_numerico "$t"; then
      v0=$(echo "$vf - $a * $t" | bc -l)
      echo "Velocidad inicial (v0) calculada: $(redondear "$v0") m/s"
    else
      echo "Error: Debe proporcionar valores numéricos para velocidad final, aceleración y tiempo."
    fi
  elif [ -z "$a" ]; then
    if es_numerico "$vf" && es_numerico "$v0" && es_numerico "$t"; then
      a=$(echo "($vf - $v0) / $t" | bc -l)
      echo "Aceleración (a) calculada: $(redondear "$a") m/s²"
    else
      echo "Error: Debe proporcionar valores numéricos para velocidad final, velocidad inicial y tiempo."
    fi
  elif [ -z "$t" ]; then
    if es_numerico "$vf" && es_numerico "$v0" && es_numerico "$a"; then
      t=$(echo "($vf - $v0) / $a" | bc -l)
      echo "Tiempo (t) calculado: $(redondear "$t") s"
    else
      echo "Error: Debe proporcionar valores numéricos para velocidad final, velocidad inicial y aceleración."
    fi
  elif [ -z "$d" ]; then
    if es_numerico "$v0" && es_numerico "$a" && es_numerico "$t"; then
      d=$(echo "$v0 * $t + 0.5 * $a * $t^2" | bc -l)
      echo "Distancia (d) calculada: $(redondear "$d") m"
    else
      echo "Error: Debe proporcionar valores numéricos para velocidad inicial, aceleración y tiempo."
    fi
  else
    echo "Todos los valores fueron ingresados. No hay incógnitas que resolver."
  fi
}

# Bucle principal para mostrar el menú y resolver según la opción seleccionada
while true; do
  mostrar_menu
  case $opcion in
    1)
      resolver_mru
      ;;
    2)
      resolver_mruv
      ;;
    3)
      convertir_unidades
      ;;
    4)
      echo "Saliendo..."
      break
      ;;
    *)
      echo "Opción no válida. Intente nuevamente."
      ;;
  esac
  read -p "Presione Enter para continuar..."
done

