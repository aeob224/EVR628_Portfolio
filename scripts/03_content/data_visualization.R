################################################################################
# Visualizing SCLTS data
################################################################################
#
# Aidan O'Brien
# aeo83@miami.edu
#
# This script visualizes two relationships that may be important for
# Santa Cruz Long-toed salamanders. First, it plots the relationship
# between the density of larvae in a pond and the overall body condition
# of those larvae. Second, it examines the relationships between densities
# of three different prey classes and the mean body condition of salamander
# larvae in each pond.
#
# Data were personally collected with coauthors Leyna Stemle, Arianne Messerman,
# and Christopher Searcy

#Load Packages #################################################################
library(tidyverse)
library(EVR628tools)
library(cowplot)

# Load Data ####################################################################
data <- read_csv("data/processed/tidy_data.csv")


#Plot Density against body condition ###########################################
##Note: Both measures are unitless as presented.
##Create density plot
density_plot <- ggplot(data = data,
       mapping = aes(x = log(larv_density),
                     y = body_condition))+
  geom_smooth(method = "gam",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(title = "Generalized Additive Model of Body Condition vs. Density",
       subtitle = "Relating Santa Cruz Long-toed salamander larval abundance to health",
       x = "log(Larval Density)",
       y = "Mean Body Condition")+
  theme_classic()
density_plot

library(mgcv)
density_model <- gam(body_condition ~ s(log(larv_density)), data = data)
summary(density_model)
##Save density plot
ggsave("density_plot.png",
       density_plot,
       path = "results/img/",
       width = 162.56,
       height = 91.44,
       units = "mm")


#Plot Body condition against prey density parameters ###########################
##Body Condition against plankton abundance
plankton <- ggplot(data = data,
       mapping = aes(x = log(plankton+1),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log-Plankton Density",
       y = "Mean Body Condition",
       title = "Body Condition vs. Plankton")+
  theme_classic()
plankton

##Actual Plankton Model
plankton_model <- lm(body_condition ~ log(plankton+1), data = data)
summary(plankton_model)

#Body Condition against medium prey abundance
medium_prey <- ggplot(data = data,
       mapping = aes(x = log(med_prey + 1),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log-Medium Prey Density",
       y = "Mean Body Condition",
       title = "Body Condition vs. Medium Prey")+
  theme_classic()
medium_prey

##Actual Medium Prey Model
med_prey_model <- lm(body_condition ~ log(med_prey+1), data = data)
summary(med_prey_model)


#Body condition against large prey abundance
large_prey <- ggplot(data = data,
       mapping = aes(x = log(large_prey),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log-Large Prey Density",
       y = "Mean Body Condition",
       title = "Body Condition vs. Large Prey")+
  theme_classic()
large_prey

##Actual large Prey Model
large_prey_model <- lm(body_condition ~ log(large_prey), data = data)
summary(large_prey_model)


##Create multi-plot object
prey_relationships <- plot_grid(plankton,
                                medium_prey,
                                large_prey,
                                ncol = 3)
prey_relationships
##Save multi-plot
ggsave(plot = prey_relationships,
       filename = "prey_relationships.png",
       path = "results/img/",
       width = 300,
       height = 91.44,
       units = "mm")
