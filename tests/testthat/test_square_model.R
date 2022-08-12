setwd("/workdir")
library(tidyverse)

describe("write dataframe with target calculate square model", {
  it("input parameters", {
    expected_b <- 6.316022
    obtained_b <- get_age_by_mass_square(0, 0)
    expect_equal(obtained_b, expected_b)
  })
})

describe("write dataframe with target column equal age, target_lineal_model", {
  it("326 rows", {
    expected_n_rows <- 326
    obtained_n_rows <- nrow(read_testing_dataset())
    expect_equal(obtained_n_rows, expected_n_rows)
  })
  it("2 columns", {
    expected_n_columns <- 2
    obtained_n_columns <- ncol(target_square_model())
    expect_equal(obtained_n_columns, expected_n_columns)
  })
  it("columns: id, target", {
    expected_name_columns <- c("id", "target")
    obtained_name_columns <- names(target_square_model())
    expect_equal(obtained_name_columns, expected_name_columns)
  })
})

describe("Write submission a csv file target square model", {
  it("writes a csv file square model", {
    submission_path <- "pollos_petrel/example_lizeth_square_model_submission.csv"
    if (file.exists(submission_path)) {
      file.remove(submission_path)
    }
    expect_false(file.exists(submission_path))
    write_lizeth_sm_submission()
    expect_true(file.exists(submission_path))
    file.remove(submission_path)
  })
})
