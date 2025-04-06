#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
# library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
        
        # using ggplot2
        # ggplot(faithful, aes(x=waiting)) +
        #   geom_histogram(aes(y = after_stat(density)), fill="grey65",
        #                  colour="white", bins = input$bins) +
        #   geom_density(fill="steelblue", alpha=0.3) +
        #   labs(
        #     x = 'Waiting time to next eruption (in mins)',
        #     title = 'Histogram of waiting times'
        #   ) +
        #   theme_minimal()
    })
}
