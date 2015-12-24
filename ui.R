library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("What's The Temperature?"),
        
        # Sidebar with a dropdown for Celsius or Farenheit and a bounded range for numeric input
        sidebarPanel(
                selectInput("which", "Convert to Celsius or Farenheit:", 
                            choices = c("Celsius", "Farenheit")),
                numericInput('temp', 'Temperature in Existing Units', 60, min = -40, max = 200, step = 1),
                submitButton('Submit')

        ),
        
        # Show a plot of the generated distribution
        mainPanel(
                h5('This application converts temperatures from Celsius to Farenheit 
                   and vice versa, and outputs the chart below. Please select the units 
                   you would like to convert to in the sidebar at left, enter the temperature in the
                   current units and hit the submit button.'),
                h4('You are converting to:'),
                verbatimTextOutput("which"),
                h4('The converted temperature is:'),
                verbatimTextOutput("temp"),
                
                plotOutput('tempPlot')
        )
))

        
        
        

        
  #      plotOutput(outputId = "main_plot", height = "300px"),
        
        # Display this only if the density is shown
   #     conditionalPanel(condition = "input.density == true",
    #                     sliderInput(inputId = "bw_adjust",
     #                                label = "Bandwidth adjustment:",
      #                               min = 0.2, max = 2, value = 1, step = 0.2)
       # )
        
##))