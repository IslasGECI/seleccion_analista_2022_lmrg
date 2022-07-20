library(tidyverse)
target_equal_one <- function() {
  target_mean <- get_target()
  testing_dataset <- read_testing_dataset()
  submission <- drop_all_but_id(testing_dataset) %>%
    mutate("target" = target_mean)
  return(submission)
}
get_target <- function() {
  target_mean <- mean(training_dataset$target)
  training_dataset <- read_training_dataset()
  return(target_mean)
}
get_age_by_mass <- function(Masa) {
  age <- -4.8192 + Masa * 0.6832
  return(age)
}
target_lineal_model <- function() {
  testing_dataset <- read_testing_dataset()
  age <- get_age_by_mass(testing_dataset$Masa)
  submission <- drop_all_but_id(testing_dataset) %>%
    mutate("target" = age)
  return(submission)
}
#' @export
write_lizeth_submission <- function() {
  submission_path <- "pollos_petrel/example_lizeth_submission.csv"
  submission <- target_equal_one()
  write_csv(submission, submission_path)
  submission_path <- "pollos_petrel/example_lizeth_submission_lineal.csv"
  submission <- target_lineal_model()
  write_csv(submission, submission_path)
}
