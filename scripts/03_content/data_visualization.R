################################################################################
# Visualizing SCLTS data
################################################################################
#
# Aidan O'Brien
# aeo83@miami.edu
#
# Description
#

#Load Packages #################################################################
library(tidyverse)
library(EVR628tools)

# Load Data ####################################################################
data <- read_csv("data/processed/tidy_data.csv")

#Initial Analysis ##############################################################




#Plot Density against
plot(x = data$larv_density,
     y = data$body_condition)
