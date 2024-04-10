# header ------------------------------------------------------------------

# This script accesses the tables stored as Google Sheets which contain data
# for the proposal. Google Sheets are edited manually and data is then read
# from here and stored locally as CSVs.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

## course schedule  --------------------------------------------------

read_sheet("1ryvEUBH8ZRfHTfJoQOEGgOVNXdzeyVbAsvHXIZB9eZU") |> 
  mutate(title = case_when(
    is.na(page_link) == FALSE ~  paste0("[", title, "](", page_link, ")"),
    TRUE ~ title
  )) |>
  write_csv(here::here("data/tbl-00-rbtl-fs24-course-schedule-main.csv"))

## learning objectives  ------------------------------

read_sheet("1JwAXgXbzm8kgJ3YtV3tN7DHVtA4aAgQ1YofyU0wCbXA") |> 
  write_csv(here::here("data/tbl-01-rbtl-fs24-learning-objectives.csv"))

## homework assignments -----------------------------------------------

read_sheet("1gYGtfgyMnzb6RzoN1qEWAXu6eMi688Na4492cQumxP0") |> 
  write_csv(here::here("data/tbl-03-rbtl-fs24-homework-assignments.csv"))

## grading conversion

read_sheet("1YED8fEJxlFkU0Zth5mUFnVQ8mfwcG5AVq9MLCS2Zqr4") |> 
  write_csv(here::here("data/tbl-05-rbtl-grading-conversion.csv"))

## grading structure

read_sheet("1cOYwKwomBUmzN5JZDtuk7rtuZ_NlWDpk30aG5iCngxg") |> 
  write_csv(here::here("data/tbl-06-rbtl-grading-structure.csv"))


## project report
read_sheet("1M272noH72YKP_NNqakKrpBeAEypgd4qYyqjRuQRKfwY") |> 
  write_csv(here::here("data/tbl-10-rbtl-fs24-capstone-project-elements.csv"))





