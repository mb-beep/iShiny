
library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Central Limit Theorem"),
  
  sidebarPanel(
    p("This simulation demonstrates the central limit theorem, one of the core tenets of modern statistical theory. The central limit theorem basically states that regardless of the underlying parent distribution of a random variable, the mean (or sum) obtained by repeatedly sampling the parent distribution will be normally distributed. This powerful result applies as long as the random variable follows a distribution with clearly defined moments and the observations are independently and identically distributed (iid)."),
    p("You can verify this for yourself by using the controls below to select a different parent distribution for a random variable and see the distribution of its sample means."),
    h4("Simulation parameters:"),
    radioButtons("dist", "Parent distribution:",
                 list("Exponential" = "rexp",
                      "Normal" = "rnorm",
                      "Log-normal" = "rlnorm",
                      "Uniform" = "runif",
                      "Poisson" = "rpois",
                      "Cauchy (pathological: momentless)" = "rcauchy")),
    br(),
    
    sliderInput("n", 
                "Number of observations in each sample from parent distribution:", 
                value = 500,
                min = 2, 
                max = 1000),
    br(),
    
    sliderInput("k", 
                "Number of samples taken from parent distribution:", 
                value = 10,
                min = 1, 
                max = 1000),
    br(),
    helpText(a(href="https://github.com/tgouhier/climit", target="_blank", "View code"))),
  
  mainPanel(
    plotOutput("plot", height="900px")
  )
))