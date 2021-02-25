# Reto 2, Loops.

#1. Genera un vector de 44 entradas (aleatorias) llamado ran.
#2. Escribe un loop que eleve al cubo las primeras 15 entradas y les sume 12.
#3. Guarda el resultado en un data frame, donde la primera columna sea el número aleatorio y la segunda el resultado, nómbralo df.al.
#4. Escribe el pseudocódigo del loop anterior.

#-----------------------------------------------------------------
# generando el vector de 44 posiciones aleatorio.
ran <- rnorm(44)

# creando el loop que eleva al cubo y suma 12 a cada posición.
el <- vector()
for (i in 1:15) {
  el[i] <- (ran[i]^3) + 12
  print(el)
}

# Se almacenan los valores en un data frame.
df.al <- data.frame(ran = ran[1:15], val = el)
df.al
#-----------------------------------------------------------------
#------------------------ pseudocódigo --------------------------- 
# ran <- {se genera el vector con 44 entradas aleatorias (rnorm)} 
# el <- {se inicializa un vector donde se almacenará el resultado} 
# for (contador desde 1 hasta 15 ){
#   el[contador] <- operación aritmética
#   se imprime el resultado (el)
# }
#-----------------------------------------------------------------
