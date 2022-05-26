setwd("/workdir")
library(tidyverse)

dataset <- tibble(id = 1:2, target = 3:4)
# Lee train.csv
describe("Read training dataset", {
  it("reads all 1304 records", {
    expected <- tibble(id = 1:2, target = rep(1,2))
    obtained <- target_equal_one()
    expect_equal(obtained, expected)
  })
})