library(testthat)
library(tidyverse)
set.seed(2)
dataset <- tibble(id = (1:100), Masa = (101:200), L_tars = rnorm(100), L_ala = rnorm(100), L_pico = rnorm(100), targ = (1:100))
# Test del modelo de regresion líneal múltiple
test_that("Create model Linel Regression Multiple", {
  lm_dt <- lm(dataset$targ ~ dataset$Masa + dataset$L_tars + dataset$L_ala + dataset$L_pico)
  expect_that(lm_dt, model_target)
})
# Test target predict
test_that("Get target", {
  expect_s3_class(predict_target, "array")
})
# Test export predict
test_that("Get target", {
  export_target_fake <- write.csv(target_fake)
  expect_that(export_target_fake, export_csv)
})

