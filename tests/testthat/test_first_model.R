setwd("/workdir")
library(tidyverse)

dataset <- tibble(id = 1:2, target = 3:4)
# Lee train.csv
describe("write dataframe with target column equal one", {
  it("326 rows", {
    expected_n_rows <- 326
    obtained_n_rows <- nrow(target_equal_one(326))
    expect_equal(obtained_n_rows, expected_n_rows)
  })
})
