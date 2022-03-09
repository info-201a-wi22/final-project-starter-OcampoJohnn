#Summary page
in_summary <- tabPanel(
  "In Summary",
  fluidRow(
    column(
      plotlyOutput("summary_map"),
      tags$h3("Police use of excessive for is a country-level problem."),
      p("While most states fall in the middle for the number of shootings 
        per one-hundred-thousand people, there are a few outliers. New Mexico,
        Oklahoma, and Alaska stand out for having a comparitely high number
        of police shootings when ajust for their population. SImilarly. 
        Rhode Island, Connecticut, and New York stand out for the opposite 
        reason. Whatever police training is happening in these states has
        proven to be effective. That said, as we have seen preivously, the
        overall number of people killed by the police is very slightly increased
        year over year."),
      hr(),
      plotlyOutput("summary_bar"),
      tags$h3("Minorities Suffer More"),
      p("White, non-Hispanic people are shot more any other race, that much is
        undeniable, but how do the other races fare? Sadly, Black, non-Hispanic
        people make up roughly half the number of White people shot. While we 
        were unable to uncover why Black people are shot so much more frequently 
        than any other race, we know that this fact is a key issue in this 
        dicussion. They should not be getting shot about two times more often 
        than what is expected."),
      hr(),
      tags$h3("Where are the Police Cameras?"),
      p("If you haven't checked the pie charts in the \"Noteable Distinctions\" 
        now is the time to do so. This was by far one of our greatest discoveries 
        in this project. We do not have any type of recording for most police 
        shooting incidents that have been tracked in the past seven years. 
        86.1%. We don't see this discussion going anywhere if we continue to 
        play a he said, she said game with the police."),
      width = 12
      )
  )
)