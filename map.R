library(tidyverse)
library(osmdata)
library(sf)

getbb("Dodge Center United States")


streets <- getbb("Dodge Center United States")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>%
  osmdata_sf()
streets


small_streets <- getbb("Dodge Center United States")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street",
                            "unclassified",
                            "service", "footway")) %>%
  osmdata_sf()

river <- getbb("Dodge Center United States")%>%
  opq()%>%
  add_osm_feature(key = "waterway", value = "river") %>%
  osmdata_sf()



ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "#7fc0ff",
          size = .4,
          alpha = .8) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "#ff7f80",
          size = .08,
          alpha = .5) +
  geom_sf(data = river$osm_lines,
          inherit.aes = FALSE,
          color = "#ff7f80",
          size = .2,
          alpha = .5) +
  coord_sf(xlim = c( -92.88541 , -92.82559), 
           ylim = c(44.00821, 44.04392),
           expand = T) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "#282828")
  )





