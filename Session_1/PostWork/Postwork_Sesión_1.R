"-------------------------------------------------------------------------

Sea (x,y) un vector aleatorio discreto con posibles 
valores en el conjunto producto:

{ x1, x2, ... } x { y1, y2, ... } <= R^2

Sean las propiedades:

f(x,y) >= 0;
sigma(x)sigma(y) f(x,y) = 1;

-------------------------------------------------------------------------"

"Importacion de los datos del archivo .CSV."
data <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

"Numero de filas y columnas del data frame."
dim(data) 

"Goles anotados por los equipos que jugaron en su casa"
data$FTHG

"Goles anotados por los equipos que jugaron como visitante"
data$FTAG