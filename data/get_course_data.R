# header ------------------------------------------------------------------

# This script accesses the tables stored as Google Sheets which contain
# the course data. Each table is read and stored locally as a CSV.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

# tbl-01-cven5837-ss23-course-schedule

googlesheets4::read_sheet("1soVpEtpSr32LWGcZGEgnv1MGyVoa81afUZitk1isuq4") |> 
  mutate(title = case_when(
    is.na(page_link) == FALSE ~  paste0("[", title, "](", page_link, ")"),
    TRUE ~ title
  )) %>% 
  write_csv(here::here("data/tbl-01-cven5837-ss23-course-schedule.csv"))

# tbl-02-cven5837-ss23-learning-objectives

googlesheets4::read_sheet("14znMSlTpFh9K6h46OxZznAmg6tyoNkTGX4SWN1J7NfE") |> 
  write_csv(here::here("data/tbl-02-cven5837-ss23-learning-objectives.csv"))

# tbl-03-cven5837-ss23-grading-scheme

googlesheets4::read_sheet("1KLEIEMuP_kD0U-OetubhElqUjtd90-tlSzdneBdsX_w") |> 
  write_csv(here::here("data/tbl-03-cven5837-ss23-grading-scheme.csv"))

