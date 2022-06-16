library(tidyverse)
target_equal_one <- function() {
  target_mean <- get_target()
  testing_dataset <- read_testing_dataset()
  submission <- drop_all_but_id(testing_dataset) %>%
    mutate("target" = target_mean)
  return(submission)
}
get_target <- function() {
  return(1)
}

#' @export
write_lizeth_submission <- function() {
  submission_path <- "pollos_petrel/example_lizeth_submission.csv"
  submission <- target_equal_one()
  write_csv(submission, submission_path)
}
