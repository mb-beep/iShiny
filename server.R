library(shiny)
library(ggplot2)

# nonCentralDT <- function(dist, degf, avg, sdev) {
#   (rt(dist, degf) * sdev) + avg
# }

shinyServer(function(input, output) {
  
#   output$normalDist <- renderPlot({
#     #hist(rnorm(input$smplSize))
#     x <- seq(1, input$smplSize, 1)
#     df <- data.frame(ind = x, dist = rnorm(input$smplSize, 0, 1))
#     ggplot(df, aes(x = dist)) + 
#       geom_histogram(aes(y = ..density..)) + 
#       geom_density(col = "black") +
#       stat_function(fun = dnorm, args = list(mean = 0, sd = 1))
#   })
  
  output$normalDist2 <- renderPlot({
    
      dist <- rnorm(input$smplSize, input$mean, input$sd)
      avg <- input$mean
      sdev <- input$sd
      degf <- input$df
    
    if(input$pType == "norm") {
      
    qplot(dist, geom = "blank") +
      geom_line(aes(y = ..density.., colour = "Empirical"), stat = "density") +
      stat_function(fun = dnorm, aes(colour = "Normal"), args = list(mean = avg, sd = sdev)) +
      #stat_function(fun = dt, aes(colour = "t-distribution"), args = list(degf)) +
      geom_histogram(aes(y = ..density..), alpha = 0.4) +
      scale_colour_manual(name = "Density", values = c("red", "blue", "green")) +
      theme(legend.position = c(0.85, 0.85))
    
    } else if(input$pType == "tdist") {
      
    qplot(rnorm(input$smplSize, 0, 1), geom = "blank") +
      geom_line(aes(y = ..density.., colour = "Empirical"), stat = "density") +
      stat_function(fun = dnorm, aes(colour = "Normal"), args = list(mean = 0, sd = 1)) +
      stat_function(fun = dt, aes(colour = "t-distribution"), args = list(degf)) +
      geom_histogram(aes(y = ..density..), alpha = 0.4) +
      scale_colour_manual(name = "Density", values = c("red", "blue", "green")) +
      theme(legend.position = c(0.85, 0.85))
    
    }
  })
  
})