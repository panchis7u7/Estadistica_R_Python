# Reto 1, Lectura y escritura de datos.

#1. Leer el archivo "netflix_titles.csv" desde Github
#(https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv), almacenarlo en un df llamado netflix
#2. Obtener la dimensión y el tipo de objeto que se obtiene
#3. Obtener los títulos que se estrenaron después del 2015. Almacenar este df en una variable llamada net.2015
#4. Escribir los resultados en un archivo .csv llamado res.netflix.csv
#-----------------------------------------------------------------
# Leyendo el fichero desde el repositorio.
netflix <-read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

# Dimensión del data frame.
dim(netflix)
class(netflix)

# Titulos que se estrenaron despues del 2015.
net.2015 <- netflix[netflix$release_year > 2015, ]

# Escritura del archivo.
write.csv(net.2015, "res.netflix.csv")
#-----------------------------------------------------------------
