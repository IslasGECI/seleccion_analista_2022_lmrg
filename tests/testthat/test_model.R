library(testthat)
library(tidyverse)
setwd("/workdir/")
# Test del modelo de regresion líneal múltiple
test_that("Create model Linel Regression Multiple", {
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
  expect_snapshot_file(export_csv, "File.csv")
})
