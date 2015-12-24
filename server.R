library(shiny)
library(ggplot2)

#two functions to invert farenheit to celsius and vice versa
calccelsius <- function(farenheit) (farenheit-32)/1.8
calcfarenheit <- function(celsius) celsius*1.8+32

#defining the main conversion function for temperature
temperature <- function(temp, type) {
        if (type=="Farenheit") {
                temp*1.8+32
        } else {
                (temp-32)/1.8
        }
}

#define server logic to calculate f
shinyServer(function(input, output) {
        output$temp <- renderPrint({temperature(input$temp, input$which)})
        output$which <- renderPrint({input$which})
        
        #all of the below will render as tempPlot
        output$tempPlot <- renderPlot({
                #setting up the calculation for the crossed red lines intersecting on the temperature line
                if (input$which=="Farenheit") {
                        vline <- calcfarenheit(input$temp)
                        hline <- calccelsius(input$temp)
                } else {
                        vline <- calccelsius(input$temp)
                        hline <- calcfarenheit(input$temp)
                }
                #making a data frame of temperatures and then plotting them
                data <- data.frame('degrees celsius'=calccelsius(-40:200),'degrees farenheit'=calcfarenheit(-40:200))
                g <- ggplot(data, aes(x=degrees.celsius, y=degrees.farenheit))+geom_point()+ggtitle("Temperature in Degrees Celsius and Farenheit")
                g+geom_vline(xintercept=vline, col="red")+geom_hline(yintercept=hline, col="red")

        })
})
    
