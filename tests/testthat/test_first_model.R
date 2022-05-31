setwd("/workdir")
library(tidyverse)

dataset <- tibble(id = 1:2, target = 3:4)
# Lee train.csv
describe("write dataframe with target column equal one", {
  it("two rows", {
    expected <- tibble(id = 1:2, target = rep(1,2))
    obtained <- target_equal_one(2)
    expect_equal(obtained, expected)
  })
  it("three rows", {
    expected <- tibble(id = 1:3, target = rep(1,3))
    obtained <- target_equal_one(3)
    expect_equal(obtained, expected)
  })
  it("three rows", {
    expected <- tibble(id = 1:4, target = rep(1,4))
    obtained <- target_equal_one(4)
    expect_equal(obtained, expected)
  })
})
