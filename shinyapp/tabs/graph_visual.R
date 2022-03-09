#Text to display blow the graph
bar_text <- ("Here we see the most commonly used types of arms victims had before
             they were killed. By far, the most common weapon a person had was 
             a gun, followed by a knife. Outside of these two distinctions, 
             however, the relative number of victims plumets and we can see a 
             much more even distribution. This means that people carrying a 
             gun or a knife while getting into an altercation with the police are much 
             more likely to die than people who do not have one. ")

#Widget data, used pick a race to analyze the data with
armed_unique <- unique(armed_visualization$armed)
armed_check <- checkboxGroupInput(inputId = "armed_check",
                                  label = "Implement Classes",
                                  choices = armed_unique,
                                  selected = armed_unique)

#Bar graph to show in tab along with text
bar_visual <- tabPanel(
  "Were They Armed?",
  sidebarLayout(
    position = "right",
    sidebarPanel(
      p("Control these"),
      armed_check),
    mainPanel(
      plotlyOutput(outputId = "bar_output"),
      br(),
      p(bar_text)
    )
  )
)