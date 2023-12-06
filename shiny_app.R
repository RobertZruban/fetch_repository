# app.R
# Load the shiny package
library(shiny)

# Define the UI for the application
ui <- fluidPage(
  # Application title
  titlePanel("Simple Shiny App"),
  
  # Sidebar layout
  sidebarLayout(
    sidebarPanel(
      # Input: Slider for the number of observations
      sliderInput("obs", "Number of observations:", min = 1, max = 1000, value = 500)
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      # Output: Histogram
      plotOutput("hist")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  # Generate a histogram of the random data
  output$hist <- renderPlot({
    hist(rnorm(input$obs), main = "Histogram of Random Data",
         col = "lightblue", border = "black")
  })
}

# Run the application
shinyApp(ui, server)
