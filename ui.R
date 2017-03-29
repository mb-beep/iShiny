library(shiny)

shinyUI(fluidPage(
  
  titlePanel("test"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("smplSize", "Number of samples:", min = 10, max = 1000, value = 250),
      hr(),
      radioButtons("pType", 
                   label = "Choose plot type:", 
                   choices = c("Normal" = "norm", "t-dist" = "tdist"), 
                  inline = T),
      sliderInput("mean", "Value for mean:", min = 0, max = 10, value = 0),
      sliderInput("sd", "Value for sd:", min = 0.1, max = 5, value = 1),
      sliderInput("df", "Degrees of freedom:", min = 1, max = 50, value = 1),
      hr()
    ),
      
    mainPanel(
#       plotOutput("normalDist"),
      plotOutput("normalDist2")
    )
  )
))
