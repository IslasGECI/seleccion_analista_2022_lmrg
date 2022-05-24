setwd("/workdir")
library(testthat)
library(vdiffr)
test_that("Print longitud tarso", {
  vdiffr::expect_doppelganger("Histogram longitud tarso", print_hist_longitud_tarso)
})
