# This file contains all of our data wrangling.
source("source/police-shootings-data-wrangling.R")


server <- function(input, output){
  # Map visualization.
  output$map_output <- renderPlotly({
    # Map data changing with the widgets.
    map_visual_df <- police_shootings_df %>% 
      filter(year == input$pick_map_year) %>% 
      filter(race == input$pick_map_race)
    # Our actual map.
    interactive_map <- plot_geo(map_visual_df, 
                                mode = "markers",
                                lat = ~latitude, 
                                lon = ~longitude) %>% 
      layout(title = paste0("Police Shootings of ", input$pick_map_race,
                            " People in ", input$pick_map_year),
             geo = g)
    interactive_map <- interactive_map %>% add_markers(
      text = ~paste(paste0(name, ", ", age), state, 
                    city, manner_of_death, sep = "<br />"),
      symbol = I("square"), size = I(9), hoverinfo = "text"
    )
    return(interactive_map)
  })
  
  #Bar graph plotly
  output$bar_output <- renderPlotly({
    #Data for our bar graph
    bar_data <- armed_visualization %>% 
      filter(armed %in% input$armed_check)
    
    #Bar graph with selected data
    interactive_bar <- plot_ly(
      bar_data,
      x = ~armed,
      y = ~Victims,
      type = "bar",
      color = ~armed,
      colors = ~my_bar_colors,
      #HTML for the hover information
      text = ~paste("<b>Victims Armed With:</b>",
                    bar_data$armed,
                    "<br>",
                    "<b>Number of Victims:</b>",
                    bar_data$Victims),
      hoverinfo = "text") %>%
      layout(title = list(text = "Most Common Implement Victims Were Armed With", 
                          font = list(color = "#ffffff")),
             xaxis = list(title = "Implement used", categoryorder = "total descending", 
                          color = '#ffffff'),
             yaxis = list(title = "Number of Victims", color = '#ffffff'),
             legend = list(title = list(text = '<b> Type of Implement </b>'), 
                           font = list(color = "#ffffff")),
             paper_bgcolor = 'rgba(125,159,184, 1)',
             plot_bgcolor = 'rgba(125,159,184, 1)'
      )
    return(interactive_bar)
  })
  
  # Coolest pie graphs I have ever seen.
  output$pie_output <- renderPlotly({
    # Data that changes with widgets
    pie_data <- pie_visualization %>% 
      mutate(count = 1) %>% 
      select(input$pie_variable, count)
    
    # Pie graphs!!
    interactive_pie <- plot_ly(
      pie_data, 
      labels = ~pie_data[[input$pie_variable]], 
      values = ~count, 
      type = 'pie') %>% 
      layout(title = list(text = paste0("Pie chart by ", input$pie_variable), 
                          font = list(color = "#ffffff")),
             legend = list(title = list(text = '<b> Variables </b>'), 
                           font = list(color = "#ffffff")),
             paper_bgcolor = 'rgba(125,159,184, 1)',
             plot_bgcolor = 'rgba(125,159,184, 1)'
      )
    return(interactive_pie)
  })
  
  # Basic map of shootings adjusted to population.
  output$summary_map <- renderPlotly({
    summary_map <- plot_geo(state_victims_pop_data, locationmode = 'USA-states') %>% 
    add_trace(
      z = ~Victims_Per_100k, locations = ~STATEID,
      color = ~Victims_Per_100k, colors = 'Purples'
    ) %>% 
    colorbar(title = "Shootings Per 100k"
    ) %>% 
    layout(
      title = 'Police Shootings by State Per 100k People',
      geo = pop_map_geo)
  })
  
  #Bar graph used in summary
  output$summary_bar <- renderPlotly({
    summary_bar <- plot_ly(
      victims_by_race,
      x = ~race,
      y = ~count,
      type = "bar",
      color = ~count) %>%
      layout(title = list(text = "Total Number of Victims by Race"),
             xaxis = list(title = "Race", categoryorder = "total descending"),
             yaxis = list(title = "Number of Victims")
      )
  })
  
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('tabs/report.rmd', quiet = TRUE)))
  })
}