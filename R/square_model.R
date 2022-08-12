library(tidyverse)
# Modelo cuadrático

get_age_by_mass_square <- function(Masa, Longitud_ala) {
  age <- 6.316022 + Masa^2 * 0.001343 + Longitud_ala * 0.354022
  return(age)
}
target_square_model <- function() {
  testing_dataset <- read_testing_dataset()
  age <- get_age_by_mass_square(testing_dataset$Masa, testing_dataset$Longitud_ala)
  submission <- drop_all_but_id(testing_dataset) %>%
    mutate("target" = age)
  return(submission)
}

#' @export
write_lizeth_sm_submission <- function() {
  submission_path <- "pollos_petrel/example_lizeth_square_model_submission.csv"
  submission <- target_square_model()
  write_csv(submission, submission_path)
}
