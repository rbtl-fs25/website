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

link01 <- "https://docs.google.com/spreadsheets/d/1mEZC4Eg786BO3xbgBQyi5bsDp9df541Ibq9TDCwplxk/edit?gid=0#gid=0"

read_sheet(link01) |> 
  mutate(title = case_when(
    is.na(page_link) == FALSE ~  paste0("[", title, "](", page_link, ")"),
    TRUE ~ title
  )) |>
  write_csv(here::here("data/tbl-00-rbtl-fs25-course-schedule-main.csv"))

## learning objectives  ------------------------------

link02 <- "https://docs.google.com/spreadsheets/d/1F0Voaxe19sSyyRn-WZP3QSj96gBuUAbqn-L2wbWxC7M/edit?gid=0#gid=0"

read_sheet(link02) |> 
  write_csv(here::here("data/tbl-01-rbtl-fs25-learning-objectives.csv"))

## homework assignments -----------------------------------------------

link03 <- "https://docs.google.com/spreadsheets/d/1NtDNmSTlhOk6ij2afttjt6b2-MtXVCZcfu8jVlt2rwA/edit?gid=0#gid=0"

read_sheet(link03) |> 
  write_csv(here::here("data/tbl-03-rbtl-fs25-homework-assignments.csv"))

## grading conversion

link04 <- "https://docs.google.com/spreadsheets/d/1IPhKALWRNfolRg5x1z4hbg5ZwXNOLmUKQcskmepY4_k/edit?usp=drive_web&ouid=106935258332658829405"

read_sheet(link04) |> 
  write_csv(here::here("data/tbl-05-rbtl-grading-conversion.csv"))

## grading structure

link05 <- "https://docs.google.com/spreadsheets/d/1nAKfKYPM9AVb1c_vfOPSIXOnnN10v0iv3URV8ifkX4g/edit?usp=drive_web&ouid=106935258332658829405"

read_sheet(link05) |> 
  write_csv(here::here("data/tbl-06-rbtl-grading-structure.csv"))

## project report

link06 <- "https://docs.google.com/spreadsheets/d/1gvHAJYYqATCi3R4bdHxeRhoXW7f5RnrSzr1yJYtx1Z4/edit?gid=0#gid=0"

read_sheet(link06) |> 
  write_csv(here::here("data/tbl-10-rbtl-fs25-capstone-project-elements.csv"))





