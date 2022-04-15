library(testthat)
library(tidyverse)
setwd("/workdir/")
set.seed(2)
dataset <- tibble(id = (1:100), Masa = (101:200), L_tars = rnorm(100), L_ala = rnorm(100), L_pico = rnorm(100), targ = (1:100))
# Test del modelo de regresion líneal múltiple
test_that("Create model Linel Regression Multiple", {
  lm_dt <- lm(dataset$targ ~ dataset$Masa + dataset$L_tars + dataset$L_ala + dataset$L_pico)
  expect_is(model_target, "lm")
})
# Test predict
test_that("Get target by test dataset", {
  target_fake <- tibble(fit = 1:325, lwr = 1:325, upr = 1:325)
  obtained_columns <- colnames(target_fake)
  expect_columns <- colnames(predict_target())
  expect_named(expect_columns, obtained_columns)
})
# Test csv export
test_that("Export csv", {
  expect_true(file.exists(export_csv))
})
