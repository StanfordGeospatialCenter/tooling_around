# Loading GeoJSON from Geoserver WFS URL:
# Load the necessary libraries
library(sf)
library(ggplot2)
library(terra)

# Define the WFS service URL and typename
geoserver_url <- "https://geowebservices.stanford.edu/geoserver/druid/ows?"
type_name <- "druid:vx572wx7854"
# Define the WFS request URL
wfs_url <- paste0(geoserver_url, 
          "service=WFS&version=1.0.0&request=GetFeature&typeName=", 
          type_name, "&outputFormat=application/json")
# Download the WFS layer
wfs_layer <- st_read(wfs_url)
# Plot the WFS layer
ggplot() +
  geom_sf(data = wfs_layer) +
  theme_minimal()



# Loading GeoJSON from STACKS URL:
# Load the necessary libraries
library(sf)
library(ggplot2)
# Define the GeoJSON URL
geojson_url <- "https://stacks.stanford.edu/file/druid:vx812cc5548/stanford-vx572wx7854-geojson.geojson"
# Download the GeoJSON layer
geojson_layer <- st_read(geojson_url)
# Plot the GeoJSON layer
ggplot() +
  geom_sf(data = geojson_layer) +
  theme_minimal()



# Load a Cloud Optimized Geotiff (COG) from URL and display it:
# Define the COG URL
cog_url <- "https://stacks.stanford.edu/file/druid%3Avq494qx9344/odm_orthophoto_COG_d.tif"

# Download the COG
cog <- rast(cog_url)

# Display the COG as an RGB image with a 100% histogram stretch
plotRGB(cog, stretch = "hist", hist.cuts = 0.98)
