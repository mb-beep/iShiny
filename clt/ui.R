# CLT shiny app
# mb

library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  
  titlePanel("Demonstration of the Central Limit Theorem (CLT)"),
  
  sidebarLayout(
    sidebarPanel(
      p("Simulation to demonstrate the Central Limit Theorem (CLT). 
      According to the CLT, the distribution of means for a large 
      number of independant, identically distributed variables will 
      approximately normal distributed, regardless of the underlying distribution."),
      hr(),
      h4("Simulation parameters:"),
      br(),
      radioButtons("pDist",
                   "Parent distribution:",
                   c("Normal" = "rnorm",
                     "Uniform" = "runif",
                     "Exponential" = "rexp",
                     "Poisson" = "rpois"),
                   ),
      br(),
      sliderInput("obsInSmpl",
                  "No. observations in sample (sample size):",
                  min = 50,
                  max = 1000,
                  value = 200),
      sliderInput("noSmpls",
                  "Number of samples:",
                  min = 1,
                  max = 1000,
                  value = 10)
      ),
    
    mainPanel(
      plotOutput("distPlot")
      )
    )
  ))