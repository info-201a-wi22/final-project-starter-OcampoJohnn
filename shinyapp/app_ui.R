library("shiny")
library("plotly")
library("markdown")
library("DT")
library("shinythemes")

source("tabs/graph_visual.R")
source("tabs/map_visual.R")
source("tabs/introduction.R")
source("tabs/pie_visual.R")
source("tabs/in_summary.R")
source("tabs/report_tab.R")


ui <- navbarPage(
  # Theme in use
  theme = shinytheme("superhero"),
  # Title of project
  title = "Police Violence",
  # Window title
  windowTitle = "Police Violence",
  # Footer with padding to make app sleeker
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    tags$style(type = "text/css", "body {padding-left: 70px;}"),
    tags$style(type = "text/css", "body {padding-right: 70px;}"),
    hr(),
    HTML("INFO-201 (Winter 2022) ("),
    a(href = "https://www.washington.edu/", "University of Washington"),
    HTML(")"),
    hr()
  ),
  # Position of the tabs
  position = "fixed-top",
  # Intro page
  intro_page,
  # Map visual
  map_visual,
  # Bar graph visual
  bar_visual,
  pie_visual,
  in_summary,
  report_tab
)















