shinyUI(fluidPage(
  titlePanel("Would you survive the sinking of the Titanic?"),
  
  sidebarLayout(
    sidebarPanel
    (
      p("Let's get some information from you..."),  
      
      selectInput("gender", label = "Are you male or female?", 
                  choices = c("Male",
                              "Female"), selected = "Male"),
      
      selectInput("pclass", label = "What class would you travel?", 
                  choices = c("First","Second","Third"), selected = "Second"),
      
      
      
      sliderInput("age",
                  "How old are you?",
                  min = 0,
                  max = 120,
                  value = 30
      ),
   
      sliderInput("sibpar",
                  "How many of your siblings and parents are on board with you?",
                  min = 0,
                  max = 10,
                  value = 0
      )
      
      
      ),
    
    
    
    mainPanel(
     # img(src="C:/titanic.jpg"),
     # br(),
     # br(),
      h4("UI.R and server.R files"),
      p("The UI.R and server.R files can be found at the following github repo:"),
      a("http://github.com/seattlestatistics/titanic",href="http://github.com/seattlestatistics/titanic"),
      br(),
      br(),
      h4("Documentation"),
      p("Full documentation on this application can be found at the following location on the Shiny website:"),
      a("https://seattlestatistics.shinyapps.io/titanicdocumentation/titanicdocumentation.Rmd",href="https://seattlestatistics.shinyapps.io/titanicdocumentation/titanicdocumentation.Rmd"),
      br(),
      br(),
      h4("Your Chances"),
      textOutput("text1"),
      br(),
      textOutput("text2"),
      br(),
      h4("The Calculations"),
      p("Binomial logistic regression was used.  This calculates something called logit, which in this situation is the log natural of the odds ratio of surviving."),
      p("This means that the anti-log of the logit is the odds ratio, and the anti-log divided by the anti-log plus one is the probability of survival."),
      p("In terms of the Titanic, a model was calculated from the passenger list.  It was formed by a number of coefficients, with b0 being a constant, b1 being the coefficient of the first variable:"),
      p("Logit = b0 + b1x1 + b2x2 + b3x4 + b4x4"),
      p("b0 is the constant, the other bs are the coefficients, the xs are your imput, with x1 being class, x2 age, x3 gender and x4 siblings and parents."),
      p("The Titanic survival model has b0 as 4.995753, b1 as -1.156828, b2 as -2.577260, b3 as -0.038740, and b4 as -0.320312."),
      br(),
      h4("Your Calculations"),
      textOutput("text3"),
      br(),
      textOutput("text4"),
      br(),
      textOutput("text5"),
      br(),
      textOutput("text6"),
      br(),
      br()
      ),
    
  )
))