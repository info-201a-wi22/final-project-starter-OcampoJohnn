# INFO 201
# Police Violence Against Marginalized Groups and Why it Happens

# These libraries are required to make this choropleth map.
library(plotly)
library(tidyverse)

# This code chunk is used to manage the data used to make the map
shootings2 <- read.csv("../data/fatal-police-shootings-data.csv", stringsAsFactors = FALSE) %>% 
  group_by(state) %>% 
  mutate(Victims = 1) %>% 
  summarise(Victims = sum(Victims))

# These are the parameters for the map.
chart_one = plot_geo(shootings2,
                            locationmode = 'USA-states') %>% 
  add_trace(locations = ~state,
            z = ~Victims,
            zmin = 0,
            zmax = max(shootings2$Victims),
            color = ~Victims,
            colorscale = 'Turbo') %>% 
  layout(geo = list(scope = 'usa'),
         title = "Total Number of Victims by State") %>% 
  config(displayModeBar = FALSE)

chart_one
