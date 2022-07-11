# header ------------------------------------------------------------------

# This script accesses the tables stored as Google Sheets which contain
# the course data. Each table is read and stored locally as a CSV.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

# tab-00_rbtl-course-schedule-main

googlesheets4::read_sheet("1tTu7X9sdTMx0QNMzkmKIoJVnS20yxISCNeMohuPTemw") |> 
  mutate(title = case_when(
    is.na(page_link) == FALSE ~  paste0("[", title, "](", page_link, ")"),
    TRUE ~ title
  )) %>% 
  write_csv(here::here("data/tab-00_rbtl-course-schedule-main.csv"))

# tab-01_rbtl-learning-objectives

googlesheets4::read_sheet("1DcpEQbeYI9gRtAnjpDrP4OEpTrLnzwnyM3-t09y45Gs") |> 
  write_csv(here::here("data/tab-01_rbtl-learning-objectives.csv"))


# tab-03_grading-scheme

googlesheets4::read_sheet("1Ec2u877jlw_4Ut1ZPJCBkIeAvdZ0peIl7BJcWQxIKUI") |> 
  write_csv(here::here("data/tab-03_grading-scheme.csv"))

