training_dataset <- read.csv("pollos_petrel/train.csv")
# Crea un histograma de longitud de tarso
print_hist_longitud_tarso <- function() {
  hist(
    training_dataset$Longitud_tarso,
    main = "Longitud de tarso",
    xlab = "Longitud tarso",
    ylab = "Frecuencia"
  )
}
