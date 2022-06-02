library(tidyverse)
target_equal_one <- function(n_rows) {
  table <- tibble(id = 1:n_rows, target = rep(1, n_rows))
  return(table)
}
