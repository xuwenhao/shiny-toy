shinyUI(
  pageWithSidebar(
    headerPanel("Predict Iris Species Through Petal Height and Width"),
    sidebarPanel(
      sliderInput('pwidth', 'Petal Width', value = 0, min = 0, max = 2.5, step = 0.05),  
      sliderInput('plength', 'Petal Length', value = 1, min = 1, max = 7, step = 0.05),
      sliderInput('swidth', 'Sepal Width', value = 2, min = 2, max = 4.5, step = 0.05),           
      sliderInput('slength', 'Sepal Length', value = 4, min = 4, max = 8, step = 0.05)      
    ),
    mainPanel(
      p("The plot in the right display all the training data used to create the iris prediction model. "),
      p("You could move the slider to adjust petal and sepal width/length of the iris. "),
      p("The application will predict the species for you and display an X in the chart to show the prediction. "),
      h4("The Prediction is : "),
      h4(textOutput('species')),
      plotOutput('newIrisPrediction')      
    )
  )
)