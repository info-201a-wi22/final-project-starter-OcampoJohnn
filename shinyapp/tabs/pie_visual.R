# 1st widget
pie_variable <- selectInput(inputId = "pie_variable",
                             label = "Pick a variable",
                             choices = c("Signs of Mental Illness", "Threat Level",
                                         "Victim Fleeing", "Wearing Camera"),
                             multiple = FALSE)


pie_visual <- tabPanel(
  "Notable distinctions",
  fluidRow(
    column(tags$h3("Signs of Mental Illness"),
           p("This variable indicated if the victim had a history of mental health 
             problems; either suicidal intention or going through mental distress 
             when they were shot."),
           tags$h3("Threat Level"),
           p("Please note that all shooting incidents were reported with the victim 
             as being a threat. Attack category marks the victims as the highest 
             level of threat to life."),
           tags$h3("Victim Fleeing"),
           p("This spcifies that the victim was moving away from officers."),
           tags$h3("Wearing Camera"),
           p("Indicates if the police officer was wearing a body camera, or if 
             they partially recorded the incident"),
           width = 3),
    column(plotlyOutput("pie_output"),
           br(),
           pie_variable,
           p("Here we see a quick breakdown of different types of statistics that are
           claimed about the victims of police shootings. Most notable of which is 
           the victim's signs of mental illness and the police officer's camera wearing 
           status. Contriary to what is parodied in the news, the overwhelming majority
           of people involved in police shootings have no history of mental illness; 
           these people were not crazy lunatics taking themselves out by using the 
           police. Similarly, it's notable that an even greater majority of police 
           officers were not wearing a camera to record what happened during the shootings."),
           width = 9)
  )
)













