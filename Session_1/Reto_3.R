#Reto 3, Operaciones con data frames.

#Utiliza el data frame de ventas de libros por Amazon y realiza las siguientes actividades:
#1. Almacenalo en un data frame que se llame amazon.best.
#2. Calcula el data frame transpuesto, asígnale el nombre de tAmazon y conviértelo en un data frame.
#3. Usa el nombre de los libros como el nombre de las columnas.
#4. ¿Cúal es el libro de menor y mayor precio?.

#-----------------------------------------------------------------
amazon.best <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/bestsellers%20with%20categories.csv")

# Convirtiendo el DF a transpuesto y en un data frame.
tAmazon <- as.data.frame(t(amazon.best))

# Usando el nombre de los libros como el nombre de las columnas.
colnames(tAmazon) <- tAmazon[1,]

row.names(tAmazon)

# libro con mayor precio.
which.max(tAmazon["Price",])

# libro con menor precio.
which.min(tAmazon["Price",])
#-----------------------------------------------------------------
