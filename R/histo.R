train_bp <- read.csv("train.csv")
#Crea un histograma de longitud de tarso.
hist(train_bp$Longitud_tarso, main = "Longitud de tarso", xlab= "Longitud tarso", ylab="Frecuencia")
