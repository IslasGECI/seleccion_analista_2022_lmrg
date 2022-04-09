test_that("Print hist", {
  disp_hist_base <- function() hist(mtcars$disp)
  disp_hist_ggplot <- ggplot(mtcars, aes(disp)) +
    geom_histogram()

  vdiffr::expect_doppelganger("Base graphics histogram", disp_hist_base)
  vdiffr::expect_doppelganger("ggplot2 histogram", disp_hist_ggplot)
})
