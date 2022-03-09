# The first and best widget, used pick a race to analyze the data with.
pick_map_race <- selectInput(inputId = "pick_map_race",
                             label = "Pick a Race to Evaluate",
                             choices = c("White, non-Hispanic",
                                         "Black, non-Hispanic",
                                         "Asian",
                                         "Native American",
                                         "Hispanic",
                                         "Other",
                                         "Unknown"),
                             multiple = FALSE)

# The second and also best widget, used to pick a year for the data.
pick_map_year <- selectInput(inputId = "pick_map_year",
                         label = "Pick a year",
                         choices = c("2015", "2016", "2017",
                                     "2018", "2019", "2020",
                                     "2021"),
                         selected = "2015",
                         multiple = FALSE)

map_visual <- tabPanel(
  "Mapping The Data",
  sidebarLayout(
    position = "left",
    sidebarPanel(
      p("Control these"),
      pick_map_race,
      pick_map_year),
    mainPanel(
      plotlyOutput(outputId = "map_output"),
      br(),
      p(paste0("As sad as it is, the total number of people killed by the", 
               "police is to large to put on a single map. As such we opted to", 
               "break the data by race and year in hopes to find meaning in the", 
               "murders. Unfortunely we didn't find much: these deaths happen in", 
               "states and areas with higher overall populations; Black people", 
               "are severly over represented relative to their population; Asian", 
               "people are underrepresented relative to their population. This", 
               "is a country-level problem."))
    )
  )
)