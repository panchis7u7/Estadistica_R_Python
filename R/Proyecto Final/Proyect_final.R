################################################################################
                                  #Paquetes

install.packages("ggplot2")
install.packages("tidyr")
install.packages("forecast")
install.packages("plotly")

suppressWarnings(suppressMessages(library(tidyr)))
suppressWarnings(suppressMessages(library(dplyr)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(forecast)))
suppressWarnings(suppressMessages(library(plotly)))

################################################################################

################################################################################
#Estabkecer el directorio en que se esta trabajando
setwd("/media/panchis/ExtraHDD/EstadisticaRP/Proyecto Final/Datos")
getwd()

#importar datos.
datos <- read.csv("Monitoreo de Tráfico de Internet_2.csv", header = TRUE, 
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
movistar <- filter(datos, Proveedor == "MOVISTAR")
claro <- filter(datos, Proveedor == "CLARO")
une <- filter(datos, Proveedor == "UNE")
directv <- filter(datos, Proveedor == "DIRECTV")

################################################################################

################################################################################
                              #Grafica de Areas.

ggplot(filtered, aes(x = Fecha, y = Trafico_Datos_Local)) +
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

grafica_movi <- ggplot(movistar) +
  geom_line(aes(x=Fecha, y= Trafico_Datos_Local), color="green", size=0.8) +
  geom_point(aes(x=Fecha, y= Trafico_Datos_Local), size=1) +
  ggtitle("Movistar") +
  labs(x="Tiempo", y="Datos (GB)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
ggplotly(grafica_movi)

grafica_une <- ggplot(une) +
  geom_line(aes(x=Fecha, y= Trafico_Datos_Local), color="green", size=0.8) +
  geom_point(aes(x=Fecha, y= Trafico_Datos_Local), size=1) +
  ggtitle("Unefon") +
  labs(x="Tiempo", y="Datos (GB)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
ggplotly(grafica_une)

grafica_claro <- ggplot(claro) +
  geom_line(aes(x=Fecha, y= Trafico_Datos_Local), color="green", size=0.8) +
  geom_point(aes(x=Fecha, y= Trafico_Datos_Local), size=1) +
  ggtitle("Claro") +
  labs(x="Tiempo", y="Datos (GB)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
ggplotly(grafica_claro)

grafica_directv <- ggplot(directv) +
  geom_line(aes(x=Fecha, y= Trafico_Datos_Local), color="green", size=0.8) +
  geom_point(aes(x=Fecha, y= Trafico_Datos_Local), size=1) +
  ggtitle("Directv") +
  labs(x="Tiempo", y="Datos (GB)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
ggplotly(grafica_directv)

################################################################################

                            #Series de tiempo

################################################################################

f <- list(family = "Courier New, monospace", size = 18, color = "black")

a <- list( text = "Movistar", font = f, xref = "paper", yref = "paper",
  yanchor = "bottom", xanchor = "center", align = "center", x = 0.5,
  y = 1, showarrow = FALSE)

b <- list(text = "Claro", font = f, xref = "paper", yref = "paper", 
  yanchor = "bottom", xanchor = "center", align = "center", x = 0.5,
  y = 1, showarrow = FALSE)

c <- list(text = "Unefon", font = f, xref = "paper", yref = "paper", 
  yanchor = "bottom", xanchor = "center", align = "center", x = 0.5,
  y = 1, showarrow = FALSE)

d <- list(text = "DirecTV", font = f, xref = "paper", yref = "paper", 
  yanchor = "bottom", xanchor = "center", align = "center", x = 0.5,
  y = 1, showarrow = FALSE)

x <- list(title = "Fecha")

y <- list(title = "Datos (GB)")

p1 <- plot_ly(movistar, x = ~Fecha, y = ~Trafico_Datos_Local) %>%
  add_lines(color = I("green"), name = "1st", legendgroup = "1st") %>% 
  layout(annotations = a, xaxis=x, yaxis=y) %>% hide_legend()

p2 <- plot_ly(claro, x = ~Fecha, y = ~Trafico_Datos_Local) %>%
  add_lines(color = I("red"), name = "1st", legendgroup = "1st") %>% 
  layout(annotations = b, xaxis=x, yaxis=y) %>% hide_legend()

p3 <- plot_ly(une, x = ~Fecha, y = ~Trafico_Datos_Local) %>%
  add_lines(color = I("yellow"), name = "1st", legendgroup = "1st") %>% 
  layout(annotations = c, xaxis=x, yaxis=y) %>% hide_legend()

p4 <- plot_ly(directv, x = ~Fecha, y = ~Trafico_Datos_Local) %>%
  add_lines(color = I("orange"), name = "1st", legendgroup = "1st") %>% 
  layout(annotations = d, xaxis=x, yaxis=y) %>% hide_legend()

subplot(p1,p2,p3,p4,nrows = 2, margin = 0.07, titleX = T, titleY = T)

#subplot(grafica_plotly_movi, grafica_plotly_claro, grafica_plotly_une, 
#grafica_plotly_directv, nrows = 2, shareX = F, titleX = F, titleY = F )

################################################################################

                                #Predicciones

#Calculamos el componente estacional del uso de datos stl(). 
#Hallamos el componente estacional de la serie mediante suavizado y 
#ajusta la serie original restando la estacionalidad.

################################################################################

                            #Prediccion movistar

#Los datos atipicos mas observables se normalizaron (7, 24 y el 31 de diciembre)
#por el promedio del dia anterior con el dia posterior.
ts_movistar = ts(movistar$Trafico_Datos_Local, start = c(2020,3,30),
                      end = c(2021,1,26), frequency = 300)
plot(ts_movistar)
#decomp_movistar = stl(ts_movistar, s.window="periodic")
#deseasonal <- seasadj(decomp_movistar)
#plot(decomp_movistar)

ma_ts_movistar <- ma(ts_movistar,2)
plot(ma_ts_movistar)

acf(ts_movistar, prob = T, ylab = "", xlab = "", main = "")
pacf(ts_movistar, main='PACF for Differenced Series')

modelo_arima_movistar <- auto.arima(ma_ts_movistar)
prediccion_movistar <- forecast(modelo_arima_movistar,10,level=95)
Box.test(residuals(modelo_arima_movistar), type = 'Ljung-Box')
plot(prediccion_movistar)
mean(na.omit(residuals(modelo_arima_movistar)))

################################################################################

################################################################################
                              #Prediccion claro

#Los datos atipicos mas observables se normalizaron 
#19 de mayo, 11 de junio, 27 de agosto(pico mayor), 13 y 30 de octubre
#(7, 24 y el 31 de diciembre) por el promedio del dia anterior con el dia posterior.

ts_claro = ts(claro$Trafico_Datos_Local, start = c(2020,3,30),
              end = c(2021,1,26), frequency=305)
plot(ts_claro)

ar <- Arima(ts_claro, order = c(3,2,2))
prediccion_claro <- forecast(ar,12,level=95)
Box.test(residuals(ar), type = 'Ljung-Box') ###p-value = 0.4485
plot(prediccion_claro)
mean(na.omit(residuals(ar)))

################################################################################

################################################################################
                              #Prediccion unefon

#Los datos atipicos mas observables se normalizaron el 16 de noviembre y 
#(17, 24, 27 y el 31 de diciembre) por el promedio del dia anterior con el 
#dia posterior.
ts_unefon = ts(une$Trafico_Datos_Local,start = c(2020,3,30),
                     end = c(2021,1,26), frequency=305)

modelo_arima_unefon <- auto.arima(ts_unefon)
prediccion_unefon <- forecast(modelo_arima_unefon, 12, level=95)
Box.test(residuals(modelo_arima_unefon), type = 'Ljung-Box')
mean(na.omit(residuals(modelo_arima_unefon)))
summary(modelo_arima_unefon)

################################################################################

#Prediccion directv
#Prediccion claro
#Los datos atipicos mas observables se normalizaron el 26 de octubre,
#(31 de diciembre, 7 de enero por el promedio del dia anterior con el dia posterior.
ts_directv = ts(directv$Trafico_Datos_Local, start = c(2020,3,30),
                end = c(2021,1,26), frequency=305)
plot(ts_directv)
#decomp_directv = stl(count_ma_directv, s.window="periodic")
#deseasonal <- seasadj(decomp_directv)
#plot(decomp_directv)

#acf(directv$Trafico_Datos_Local, prob = T, ylab = "", xlab = "", main = "")
#pacf(directv$Trafico_Datos_Local, main='PACF for Differenced Series')
modelo_arima_directv <- auto.arima(ts_directv, seasonal=TRUE)
#tsdisplay(residuals(modelo_arima_directv), lag.max=10, main='(2,0,0) Model Residuals')
prediccion_directv <- forecast(modelo_arima_directv, 12, level=95)
Box.test(residuals(modelo_arima_directv), type = 'Ljung-Box')
mean(na.omit(residuals(modelo_arima_directv)))

par(mfrow=c(2,2))
plot(prediccion_movistar, main = "Movistar ARIMA", xlab="Tiempo", ylab = "Datos (GB)")
plot(prediccion_claro, main = "Clarovideo ARIMA", xlab="Tiempo", ylab = "Datos (GB)")
plot(prediccion_unefon, main = "Unefon ARIMA", xlab="Tiempo", ylab = "Datos (GB)")
plot(prediccion_directv, main = "Directv ARIMA", xlab="Tiempo", ylab = "Datos (GB)")
################################################################################

