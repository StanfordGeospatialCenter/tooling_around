# Load the necessary libraries
library(sf)
library(ggplot2)

# Define the WFS service URL and typename
geoserver_url <- "https://geowebservices.stanford.edu/geoserver/druid/ows?"
type_name <- "druid:vx572wx7854"
# Define the WFS request URL
wfs_url <- paste0(
    geoserver_url,
    "service=WFS&version=1.0.0&request=GetFeature&typeName=",
    type_name, "&outputFormat=application/json"
)
# Download the WFS layer
wfs_layer <- st_read(wfs_url)
# Plot the WFS layer
ggplot() +
    geom_sf(data = wfs_layer) +
    theme_minimal()