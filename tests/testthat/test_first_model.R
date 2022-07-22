setwd("/workdir")
library(tidyverse)

dataset <- tibble(id = 1:2, target = 3:4)
# Lee train.csv
describe("write dataframe with target column equal one", {
  it("326 rows", {
    expected_n_rows <- 326
    obtained_n_rows <- nrow(target_equal_one())
    expect_equal(obtained_n_rows, expected_n_rows)
  })
})
describe("write dataframe with target calculate lineal model", {
  it("input parameters", {
    expected_b <- -4.8192
    obtained_b <- get_age_by_mass(0)
    expect_equal(obtained_b, expected_b)
  })
})