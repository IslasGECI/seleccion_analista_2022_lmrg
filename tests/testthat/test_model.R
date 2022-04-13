library(testthat)
library(tidyverse)
library(skimr)
#Test del modelo de regresion líneal múltiple
test_that("Create model Linel Regression Multiple", {
  set.seed(2)
  dataset<-tibble(id = (1:100), Masa=(101:200), L_tars=rnorm(100), L_ala=rnorm(100), L_pico=rnorm(100), targ = (1:100))
  lm_dt <- lm(id~ Masa + L_tars + L_ala + L_pico)
  expect_output(lm_dt, model_target)
})
test_that("Get target", {
  set.seed(2)
  dataset<-tibble(id = (1:100), Masa=(101:200), L_tars=rnorm(100), L_ala=rnorm(100), L_pico=rnorm(100))
  target_fake<- predict(object = lm_dt, newdata = test_dataset, interval = "confidence", level = 0.95)
  expect_output( target_fake, predict_target)
})

