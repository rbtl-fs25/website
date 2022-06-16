# header ------------------------------------------------------------------

# This script accesses the tables stored as Google Sheets which contain
# the course data. Each table is read and stored locally as a CSV.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

# tab-00_rbtl-course-schedule-main

googlesheets4::read_sheet("1BLIboILqaAHh_4fDvuOZV8kOeYtv0YSsQAnohR9CXjw") %>% 
  mutate(title = case_when(
    is.na(page_link) == FALSE ~  paste0("[", title, "](", page_link, ")"),
    TRUE ~ title
  )) %>% 
  write_csv(here::here("data/tab-00_rbtl-course-schedule-main.csv"))

# tab-01_rbtl-learning-objectives

googlesheets4::read_sheet("1HaEIV5K85p2kER8BmIsmkk6cAoEw6tZz-X6pP9B8PMY") %>%
  write_csv(here::here("data/tab-01_rbtl-learning-objectives.csv"))

# tab02_rtbl-slides-resources

googlesheets4::read_sheet("1P-_o2Bwd-Uf4OhjD3_HdzpSSGCx31hZ8Wi67gKegBXI") %>% 
  mutate(slides = case_when(
    lecturer == "E. Tilley" ~ paste0("[", "Access slides on Moodle", "](", link, ")"),
    lecturer == "L. Schöbitz" & format == "html" ~ paste0("[", "Access slides in browser", "](", link, ")"),
    lecturer == "L. Schöbitz" & format == "pdf" ~ paste0("[", "Access slides as PDF", "](", link, ")")
    )) %>% 
  select(-format) %>% 
  write_csv(here::here("data/tab-02_rtbl-slides-resources.csv"))

## tab-03_rbtl-course-assignments

googlesheets4::read_sheet("1TJqCe1Np3GkfDpqIJqlMWwlYzV_4qtI-euPE4aKTUa4") %>% 
  mutate(title_link = paste0("[", title, "](", link, ")")) %>% 
  write_csv(here::here("data/tab-03_rbtl-course-assignments.csv"))

## tab-05_rbtl-grading-structure

googlesheets4::read_sheet("1l4rffWN2dSv-q_avSzYCUoFeExl8ben2JenNHHE-HN8") %>% 
  write_csv(here::here("data/tab-05_rbtl-grading-structure.csv"))

## tab-09_rbtl-grading-conversion

googlesheets4::read_sheet("15BSoUBkNOCi_IflsEwJpCojBiSQzZjUsppUxUkg1eHc") %>%
  write_csv(here::here("data/tab-09_rbtl-grading-conversion.csv"))
