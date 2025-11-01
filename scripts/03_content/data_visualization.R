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


#Plot Density against body condition ###########################################
##Note: Both measures are unitless as presented.
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


#Plot Body condition against multiple stressors and create a multi-plot
##Salinity plot
ggplot(data = data,
       mapping = aes(x = log(salinity +0.1),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log(Salinity)",
       y = "Mean Body Condition")



#Body Condition against plankton abundance
ggplot(data = data,
       mapping = aes(x = log(plankton +1),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log(# of Plankton)",
       y = "Mean Body Condition")

#Body Condition against medium prey abundance
ggplot(data = data,
       mapping = aes(x = log(med_prey +1),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log(Medium Prey Abundance)",
       y = "Mean Body Condition")

#
