################################################################################
                                  #Paquetes

install.packages("ggplot2")
install.packages("tidyr")

suppressWarnings(suppressMessages(library(tidyr)))
suppressWarnings(suppressMessages(library(dplyr)))
suppressWarnings(suppressMessages(library(ggplot2)))

################################################################################

################################################################################
#Estabkecer el directorio en que se esta trabajando
setwd("/media/panchis/ExtraHDD/EstadisticaRP/Proyecto Final/Datos")
getwd()

#importar datos.
datos <- read.csv("Monitoreo de Tráfico de Internet.csv", header = TRUE, 
                  sep = ",", check.names = FALSE)

#Inspeccionar datos.
head(datos)
class(datos)
str(datos)

#Transformamos las columnas de factor a asu correspondiente tipo.
datos <- mutate(datos, Fecha = as.Date(Fecha, "%m/%d/%Y"))
str(datos)

#gather() -> Gather Columns Into Key-Value Pairs.
df <- datos %>%
  select(Fecha, Proveedor, Trafico_Datos_Local)
head(df, 3)

################################################################################

################################################################################

#Separamos los datos de la companias mas "Influyentes".
list_of_values <- c("CLARO", "MOVISTAR", "UNE", "DIRECTV")
filtered <- filter(datos, Proveedor %in% list_of_values)

################################################################################

################################################################################
                              #Grafica de Areas.

ggplot(datos, aes(x = Fecha, y = Trafico_Datos_Local)) +
  geom_area(aes(color = Proveedor, fill = Proveedor),
  alpha = 0.5, position=position_dodge(0.8)) +
  ggtitle("Trafico de datos durante la pandemia") +
  xlab("Mes 2020") +
  ylab("Datos en GB") +
  theme_minimal() +
  scale_color_manual(values=c("#00AFBB", "#E7B800", "#CC0000", "#006600", 
                              "#669999", "#00CCCC", "#660099", "#CC0066", 
                              "#FF9999", "#FF99FF", "#559955", "#A990CC", 
                              "#660099", "#CC0066")) +
  scale_fill_manual(values=c( "#00AFBB", "#E7B800", "#CC0000", "#006600", 
                              "#669999", "#00CCCC", "#660099", "#CC0066", 
                              "#FF9999", "#FF99FF", "#559955", "#A990CC", 
                              "#660099", "#CC0066"))

################################################################################

################################################################################
                          #Graficas de Comportamiento.

#Nel compa.
#lot(filtered$Fecha, filtered$Trafico_Datos_Local)

ggplot(filtered, aes(x=Fecha, y=Trafico_Datos_Local, colour = Proveedor)) +
  ggtitle("Trafico de datos durante la pandemia")+ 
  xlab("Mes")+
  ylab("Datos en GB") +
  geom_point() +
  theme_minimal() 

################################################################################

################################################################################

ggplot(filtered, aes(x = Fecha, y = Trafico_Datos_Local)) +
  geom_line(aes(color = Proveedor), size = 1) +
  ggtitle("Series de tiempo de trafico local")+ 
  xlab("Mes")+
  ylab("Datos en GB") +
  scale_color_manual(values=c("#00AFBB", "#E7B800","#CC0000", "#006600")) +
  theme_minimal()

################################################################################
