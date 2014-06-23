library(shiny)
library(e1071)
library(ggplot2)
library(lattice)
library(rpart)
library(caret)
data(iris)

modelFit <- train(Species ~ ., method='rpart', data=iris)

shinyServer(
  function(input, output) {    
    x <- reactive({
      sample <- data.frame(Petal.Width = input$pwidth, Petal.Length = input$plength, 
                           Sepal.Width = input$swidth, Sepal.Length = input$slength)
      result <- predict(modelFit, sample)
      sample$Species <- result  
      sample
    })
    output$newIrisPrediction <- renderPlot({
      p <- qplot(Petal.Width, Petal.Length, col=Species, data=iris) + 
        geom_point(aes(x=Petal.Width, y=Petal.Length, col=Species), size=8, shape=4, data=x())
      print(p)
    })
    output$species <- renderText({
      as.character(x()$Species)
    })
  }  
)