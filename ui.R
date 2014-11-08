library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Hello Shiny!"),
  
  radioButtons(inputId = "language", label = "",
               choices = c("English" = "en", "Français" = "fr"),
               selected = "en"),
  
  sidebarLayout(
    
    sidebarPanel(
      uiOutput("uiObs"),
      uiOutput("uiWeekdays")
      ),
    
    mainPanel(
      plotOutput("distPlot"),
      textOutput("description")      
    )
  )
))
