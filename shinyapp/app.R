# Libraries
library(shiny)
library(shinythemes)
library(tidyverse)
library(plotly)
library(markdown)
library(knitr)

# Server and ui
source("app_server.R")
source("app_ui.R")

# App
shinyApp(ui = ui, server = server)