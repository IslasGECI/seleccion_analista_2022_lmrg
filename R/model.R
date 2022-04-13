library(skimr)
training_dataset <- read.csv("/Users/lizethreyes/Desktop/seleccion_analista_2022_lmrg/pollos_petrel/train.csv")
skim(training_dataset)
# Ajuste del modelo  Y = beta0 + beta1Masa + beta2Longitud_tarso + beta3Longitud_pico + e
model_target <- function(){
  m1 <- lm(target ~ Masa + Longitud_tarso + Longitud_ala + Longitud_pico)
  }
# Predice Target de test.csv
test_dataset <- read.csv("/Users/lizethreyes/Desktop/seleccion_analista_2022_lmrg/pollos_petrel/test.csv")
summary(test_dataset)
predict_target<- function(){target_new <- predict(object = m1, newdata = test_dataset, interval = "confidence", level = 0.95)}
