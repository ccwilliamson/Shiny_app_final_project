## Shiny app for microbiome data viewing 
## Cecelia Williamson
## March 2026

library(bslib)

ui <- fluidPage(
  h1("Infant Microbiome Relative Abundance Viewer"),
  
  p("Explore infant microbiome data based on diet and gender differences. Infants were fed different diets in the first year of life. Select from breastmilk, traditional formula, and supplemented formula to see how the microbiome composition changes. "),
fluidRow(
  column(4,
         p("Select Data Input"),
         selectizeInput( 
           "select", 
           "Select options below:", 
           list("Breast milk",
                "Standard infant formula", 
                "Experimental infant formula"), 
           multiple = TRUE
         )),
  
  column(4,
         p("Filter for a specific age range"),
         numericInput( 
           "Age", 
           "Infant Age (months)", 
           value = 6, 
           min = 0, 
           max = 12
         )),
  
    column(4, 
           checkboxGroupInput(
            inputId = "Gender",
             label = "Select Options:",
               choices = c("Male", "Female"),
                inline = TRUE))
),
  fluidRow(
    column(6,
           plotOutput("plot1")),
      column(6, conditionalPanel(
       condition = "input.Gender.length == 2" ,
       plotOutput("plot2")))

)

)
  

