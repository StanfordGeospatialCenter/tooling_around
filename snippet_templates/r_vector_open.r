# This code downloads and plots a WFS layer as a GeoJSON file using R
# Load the necessary libraries
library(sf)
library(ggplot2)

# Define the WFS service URL and typename
geoserver_url <- "https://geowebservices.stanford.edu/geoserver/wfs?"
type_name <- "druid:vx572wx7854"

# Define the WFS request URL
wfs_url <- paste0(
    geoserver_url,
    "service=WFS&version=1.0.0&request=GetFeature&typeName=",
    type_name, "&outputFormat=application/json"
)

# Define the local file name based on type_name
local_geojson <- paste0(type_name, ".geojson")

# Download the WFS layer as a GeoJSON file
download.file(wfs_url, destfile = local_geojson, mode = "wb")

# Read the GeoJSON file from the local disk
wfs_layer <- st_read(local_geojson)

# Plot the WFS layer
ggplot() +
    geom_sf(data = wfs_layer) +
    theme_minimal()
