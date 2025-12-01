################################################################################
# Visualizing ponds sampled for SCLTS
################################################################################
#
# Aidan O'Brien
# aeo83@miami.edu
#
# This script creates a visualization of all the ponds sampled in Santa Cruz and
# Monterey counties, CA, USA, between 2021 and 2024. Some ponds were sampled
# multiple times, but the point of this map is to show the full extent and sum
# of ponds sampled in that time and whether or not endangered Santa Cruz long-toed
# salamander larvae were detected at least once during the survey period.
#

# Load packages ################################################################
library(tidyverse)
library(sf)
library(rnaturalearth)
library(mapview)
library(terra)
library(ggspatial)
library(cowplot)

# Load Data ####################################################################
##Pond location and breeding activity data
ponds <- read_csv("data/raw/coordinates.csv") |>
  mutate(across(breeding_pond,
                ~case_when(. == 0 ~ "No",
                           . == 1 ~ "Yes"))) |>
  st_as_sf(coords = c("lon", "lat"),
           crs = 4269)


##California county layer
counties <- read_sf(dsn = "data/raw/California_Counties_-310302818977097603.gpkg") |>
   st_transform(crs = 4269)

##California counties cropped to Santa Cruz and Monterey Counties
counties_crop <- read_sf(dsn = "data/raw/California_Counties_-310302818977097603.gpkg") |>
  st_transform(crs = 4269) |>
  st_crop(ponds,
          xmin = -121.9626,
          xmax = -121.612,
          ymin = 36.7557,
          ymax = 37.000)



# Plot Data ####################################################################
##Create inset to provide better geographic context
inset <- ggplot() +
  geom_sf(data = counties,
          fill = "grey") +
  geom_rect(aes(
             xmin = -122.0626,
             xmax = -121.512,
             ymin = 36.6557,
             ymax = 37.100),
             fill = "transparent",
             color = "red",
             linewidth = 1)+
  theme_test()+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())

##Plot of all surveyed ponds and whether they had successful breeding between 2021 and 2024
SCLTS_ponds <- ggplot()+
  geom_sf(data = counties_crop,
          fill = "grey")+
  geom_sf(data = ponds,
          mapping = aes(color = breeding_pond))+
  theme_classic()+
  labs(title = "SCLTS Breeding Pond Status",
       subtitle = "Ponds surveyed between 2021 and 2024",
       color = "Larvae Detected?",
       x = "Long",
       y = "Lat",
       caption = "Data: California Open Data Portal")+
  annotation_north_arrow(style = north_arrow_fancy_orienteering,
                         location = "tl")+
  annotation_scale(location = "bl")


final_map <- ggdraw() +
  draw_plot(SCLTS_ponds) +
  draw_plot(inset, x = 0.505, y = 0.605, width = 0.3, height = 0.3)

final_map
ggsave(plot = final_map,
       filename = "results/img/pond_survey_map.png")

