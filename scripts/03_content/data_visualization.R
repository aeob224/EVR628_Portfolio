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




#Plot Density against body condition
ggplot(data = data,
       mapping = aes(x = log(larv_density),
                     y = body_condition))+
  geom_smooth(method = "gam",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(title = "Generalized Additive Model of Body Condition vs. Density",
       subtitle = "Relating Santa Cruz Long-toed salamander larval abundance to health",
       x = "log(Larval Density)",
       y = "Mean Body Condition")
