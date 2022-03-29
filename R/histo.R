<<<<<<< HEAD:R/histo.R
train_bp <- read.csv("seleccion_analista_2022_lmrg/pollos_petrel/train.csv")
=======
train_bp <- read.csv("train.csv")
>>>>>>> 6b84e69d057c2e4fc71e4847a4e9da9d620d95b0:R/histo.R
#Crea un histograma de longitud de tarso
hist(train_bp$Longitud_tarso, main = "Longitud de tarso", xlab= "Longitud tarso", ylab="Frecuencia")

