library(shiny)

shinyServer(function(input, output) {
  
  output$normalDist <- renderPlot({
    hist(rnorm(input$smplSize))
  })
  
})