# header ------------------------------------------------------------------

# This script accesses the tables stored as Google Sheets which contain
# the course data. Each table is read and stored locally as a CSV.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

# course-schedule

googlesheets4::read_sheet("18vF8LFHg3CBrcRqZZcE13G9UxgFXWmQwTnTUi_H8yGU") |> 
  mutate(title = case_when(
    is.na(page_link) == FALSE ~  paste0("[", title, "](", page_link, ")"),
    TRUE ~ title
  )) |> 
  write_csv(here::here("data/tbl-01-ds4owd-001-course-schedule.csv"))

# learning-objectives

googlesheets4::read_sheet("14znMSlTpFh9K6h46OxZznAmg6tyoNkTGX4SWN1J7NfE") |> 
  write_csv(here::here("data/tbl-02-ds4owd-001-learning-objectives.csv"))


