
library(shiny)


load("translation.bin") # contains the dictionary, parsed as a double list

shinyServer(function(input, output) {

  tr <- function(text){ # translates text into current language
    sapply(text,function(s) translation[[s]][[input$language]], USE.NAMES=FALSE)
  }
  
  output$distPlot <- renderPlot({
    plot(1:input$obs,1:input$obs, main = tr("plotTitle"))
    
  })
  
  output$description <- renderText({
    paste0(tr("numberOfObservations"), ": ",input$obs)
    
  })
  
  output$description <- renderText({
    paste(tr("You have selected:"), paste(tr(input$weekdays), collapse = ', '))
    
  })
  
  
  # UI
  output$uiObs <- renderUI({
    sliderInput("obs", tr("numberOfObservations"),  
                  min = 1, max = 100, value = 50)
  })
  
  output$uiWeekdays <- renderUI({
    # Using a named list in order to pass the same value regardless of the label (which changes with the language)
    daysValue <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
    days <- structure(daysValue, .Names = tr(daysValue))
    
    selectInput(inputId   = "weekdays",
                label     = tr("Selection:"),
                choices   = days,
                multiple  = TRUE)
  })
  
})
