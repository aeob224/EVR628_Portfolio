################################################################################
# Data tidying for EVR628 project
################################################################################
#
# Aidan O'Brien
# aeo83@miami.edu
# date
#
#
#
# SET UP #######################################################################

## Load packages ---------------------------------------------------------------
library(EVR628tools)
library(tidyverse)
library(janitor)

## Load data -------------------------------------------------------------------
morphometric_data <- read_csv("data/raw/morphometric_variables.csv", na = c("n/a", "")) |>
  unite(col = "pond_year",
        pond, year)

aquatic_data <- read_csv("data/raw/aquatic_variables.csv") |>
  unite(col = "pond_year",
        pond, year)

# PROCESSING ###################################################################
## Filter morphometric data entries missing SVL and mass and log transforms them
filtered_morphometric <- morphometric_data |>
  filter_at(vars(mass, svl), all_vars(!is.na(.))) |>
  mutate(svl = log(svl)) |>
  mutate(mass = log(mass))



## Create dataset with average body condition by year and pond -------------------------------------------------------------------
##Note: Body condition is calculated as the residuals of log(mass) vs. log(snout to vent length) in amphibians
body_conditions <-



?mutate
