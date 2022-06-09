library(tidyverse)
target_equal_one <- function(n_rows) {
  target_mean <- get_target()
  testing_dataset <- read_testing_dataset()
  submission <- drop_all_but_id(testing_dataset) %>%
    mutate("target" = target_mean)
  return(submission)
}
get_target <- function() {
  return(1)
}
