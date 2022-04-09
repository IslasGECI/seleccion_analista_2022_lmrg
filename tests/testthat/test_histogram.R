 library("ggplot2")

  test_that("Print longitud tarso", {
    data_fake<-data.frame("longitud_fake"=c(12,12,12,12,17.2,17.2,17.2,17.2,17.2,17.2,20,20,20,20,20,20))
    disp_hist_base <- function() hist(data_fake$longitud_fake)
   vdiffr:: expect_doppelganger("disp-histogram-base", disp_hist_base)

     vdiffr::expect_doppelganger("Histogram longitud tarso",print_hist_longitud_tarso)

  })
