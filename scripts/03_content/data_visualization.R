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
library(cowplot)

# Load Data ####################################################################
data <- read_csv("data/processed/tidy_data.csv")


#Plot Density against body condition ###########################################
##Note: Both measures are unitless as presented.
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
  theme_bw()

ggsave("density_plot.png",
       density_plot,
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
  labs(x = "log(Plankton Density)",
       y = "Mean Body Condition",
       title = "Body Condition vs. Plankton")+
  theme_bw()

#Body Condition against medium prey abundance
medium_prey <- ggplot(data = data,
       mapping = aes(x = log(med_prey + 1),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log(Medium Prey Density)",
       y = "Mean Body Condition",
       title = "Body Condition vs. Medium Prey")+
  theme_bw()

#Body condition against large prey abundance
large_prey <- ggplot(data = data,
       mapping = aes(x = log(large_prey),
                     y = body_condition))+
  geom_smooth(method = "lm",
              color = "black")+
  geom_point(color = "steelblue")+
  labs(x = "log(Large Prey Density)",
       y = "Mean Body Condition",
       title = "Body Condition vs. Large Prey")+
  theme_bw()


prey_relationships <- plot_grid(plankton,
                                medium_prey,
                                large_prey,
                                ncol = 3)

ggsave(plot = prey_relationships,
       filename = "prey_relationships.png",
       width = 300,
       height = 91.44,
       units = "mm")
