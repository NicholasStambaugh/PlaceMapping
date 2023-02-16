#--Nick Stambaugh--#
#--The Right Place, INC--#

#############SPATIAL MAPPING FOR PLACE#############


# Load packages
library(sf)
library(ggplot2)
library(leaflet)

# Read in building location data
building_data <- read.csv("building_locations.csv")

# Convert to spatial object
building_points <- st_as_sf(building_locations, coords = c("Longitude", "Latitude"), crs = 4269)

# Plot on map for spatial understanding
ggplot() + 
  geom_sf(data = building_points) + 
  theme_bw()

#############INTERACTIVE MAP FOR PLACE#############


# Create leaflet map
m <- leaflet() %>%
  
  # Add tile layer for the base map
  addTiles() %>%
  
  # Add markers for the building locations
  addCircleMarkers(data = building_locations, 
                   lat = ~Latitude, 
                   lng = ~Longitude, 
                   color = "black", 
                   radius = 0.5,
                   popup = building_locations$Name)


# Display map, highlight to line 26 and run
m
