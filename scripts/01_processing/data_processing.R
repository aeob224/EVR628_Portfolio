################################################################################
# Data tidying for EVR628 project
################################################################################
#
# Aidan O'Brien
# aeo83@miami.edu
#
#This script is to tidy data collected on Santa Cruz long-toed salamander
#body conditions and aquatic habitat characteristics.

# Load packages ################################################################################
library(EVR628tools)
library(tidyverse)
library(janitor)
library(readr)

# Load data ################################################################################
##Morphometric data from larval sampling
morphometric_data <- read_csv("data/raw/morphometric_variables.csv", na = c("n/a", "", "MISSING")) |>
  unite(col = "pond_year",
        pond, year)

##Aquatic habitat data
aquatic_data <- read_csv("data/raw/aquatic_variables.csv") |>
  unite(col = "pond_year",
        pond, year)


# Converting morphometric data into mean body condition by pond and year###################################################################
## Filter morphometric data entries missing SVL and mass and log transforms them
filtered_morphometric <- morphometric_data |>
  filter_at(vars(mass, svl), all_vars(!is.na(.))) |>
  mutate(svl = log(svl)) |>
  mutate(mass = log(mass))

##Adding a column for body condition
##Note: Body condition is calculated as the residuals of log(mass) vs. log(snout to vent length) in amphibians
filtered_morphometric$body_condition <- residuals(lm(mass ~ svl, filtered_morphometric))

##Summarizing body condition by pond and year
summary_body_condition <- filtered_morphometric |>
  group_by(pond_year) |>
  summarize(body_condition = mean(body_condition))



#Joining mean body condition with aquatic data ###################################################################
model_data <- summary_body_condition |>
  left_join(aquatic_data,
            by = join_by(pond_year))

#Write tidy data file ################################################################################
write_csv(model_data, "data/processed/tidy_data.csv")
