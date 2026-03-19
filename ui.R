## Shiny app for microbiome data viewing 
## Cecelia Williamson
## March 2026

library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("cerulean"),
  
  h1("Infant Microbiome Relative Abundance Viewer"),
  
  p("Explore infant microbiome data based on diet and gender differences. Infants were fed different diets in the first year of life. Select from breastmilk, traditional formula, and supplemented formula to see how the microbiome composition changes. "),
fluidRow(
  column(4,
         selectizeInput( 
           "select", 
           "Select One or More Infant Diets:", 
           list("Breast milk",
                "Standard infant formula", 
                "Experimental infant formula"), 
           multiple = TRUE
         )),
  
  column(4,
         selectInput(
           "Age",
           "Select Infant Age (months)",
           choices = c(2, 4, 6, 12),
           selected = 6
         )),
  
    column(4, 
           checkboxGroupInput(
            inputId = "Gender",
             label = "Select Male/Female or Both:",
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
  

