library(shiny)

shinyUI(fluidPage(
  
  titlePanel("test"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("smplSize", "Number of samples:", min = 2, max = 500, value = 200)
    ),
      
    mainPanel(
      plotOutput("normalDist")
    )
  )
))
