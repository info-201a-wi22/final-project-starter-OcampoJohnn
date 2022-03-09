# Project's introduction page
intro_page <- tabPanel(
  "Introduction",
    fluidRow(
      column(
        12,
        h1("Purpose"),
        p("Police shootings of civilians have been at the forefront of seemingly 
          every news cycle for the past half of decade. Every year tragic police 
          shootings spark nation wide protests for police reform, but these 
          incidents seem never ending. With the usage of The Washington Post's
          police shooting database we seek to learn more about why police officers
          resort to such fatal measures when dealing with civilians. To that end,
          we focused our efforts into three main questions for this project"),
        tags$ul(
          tags$li("Who are the people most affected by police shootings?"), 
          tags$li("What are the most common reasons police officers may cite for fatal encounters?"), 
          tags$li("Where do police shootings take place the most?")
        ),
        hr(),
        img(
          class = "img-polaroid",
          src = "hands-up-dont-shoot.gif"
          )
        ,
        tags$small(tags$br(),
          "Illustration made by Tom CJ Brown. Retrived from his website's ",
          a(
            href = "https://www.tomcjbrown.com/",
            "illustration page."
          )
        )
      )
    )
  )
