suppressWarnings(suppressMessages(library(dplyr)))

#Estabkecer el directorio en que se esta trabajando
setwd("/media/panchis/ExtraHDD/EstadisticaRP/Proyecto Final/Datos")
getwd()

#importar datos.
datos <- read.csv("Monitoreo de Tráfico de Internet.csv", header = TRUE, sep = ",", check.names = FALSE)
head(datos)
class(datos)
str(datos)

#Transformamos las columnas de factor a asu correspondiente tipo.
datos <- mutate(datos, Fecha = as.Date(Fecha, "%m/%d/%Y"))
str(datos)
