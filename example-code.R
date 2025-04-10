
# Adding theming
library(shinythemes)
theme = shinytheme("cerulean"), # cerulean, flatly, darkly

# histogram plot
library(ggplot2)
ggplot(faithful, aes(x=waiting)) +
  geom_histogram(aes(y = after_stat(density)), fill="grey65",
                 colour="white", bins = input$bins) +
  geom_density(fill="steelblue", alpha=0.3) +
  labs(
    x = 'Waiting time to next eruption (in mins)',
    title = 'Histogram of waiting times'
  )


# customising ggplot charts

base_theme <- theme_minimal() +
  theme(
    plot.title = element_text(size=20),
    axis.title.x = element_text(size=16),
    axis.title.y = element_text(size=16),
    axis.text = element_text(size=14)
  )
theme_set(base_theme)




# linear model UI.R code
,
selectInput("predictor",
            label = "Predictor",
            choices = c("Horsepower"="hp", 
                        "Rear axle ratio"="drat", 
                        "Weight (1000lbs)"="wt"))


, plotOutput("linearModelPlot")

# server.R code
output$linearModelPlot <- renderPlot({
  
  data.frame(
    x = unname(mtcars[input$predictor]),
    y = mtcars$mpg
  ) |> 
    ggplot(aes(x,y)) +
    geom_point() +
    geom_smooth(method="lm") +
    labs(
      title = "Simple Linear Model of Vechile MPG",
      x = input$predictor,
      y = "Miles/gallon"
    )
})