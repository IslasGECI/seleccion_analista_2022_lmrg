library(skimr)
training_dataset <- read.csv("pollos_petrel/train.csv")
skim(training_dataset)
# Ajuste del modelo  Y = beta0 + beta1Masa + beta2Longitud_tarso + beta3Longitud_pico + e
model_target <- function(){
m1 <- lm(training_dataset$target ~ training_dataset$Masa + training_dataset$Longitud_tarso + training_dataset$Longitud_ala + training_dataset$Longitud_pico)
}
# Predict Target de test.csv
test_dataset <- read.csv("pollos_petrel/test.csv")
summary(test_dataset)
predict_target <- function(){
  target_new <- predict(object = m1, newdata = test_dataset, interval = "confidence", level = 0.95)
}
#Export target predict
export_csv <- function(){
  write.csv(target_new,"pollos_petrel/target.csv", row.names = FALSE)
}
