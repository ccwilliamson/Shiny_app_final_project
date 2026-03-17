## Shiny app for microbiole data viewing 
## Cecelia Williamson
## March 2026

library(bslib)

ui <- fluidPage(
  h1("Infant Microbiome Relative Abundance Viewer"),
  
  p("Explore infant microbiome data based on diet and gender differences. Infants were fed different diets in the first year of life. Sleect from breastmilk, traditional formula, and supplemented formula to see how the microbiome composition changes. "),
  
  column(6,
         p("Select Data Input"),
         selectizeInput( 
           "select", 
           "Select options below:", 
           list("Breast milk",
                "Standard infant formula", 
                "Experimental infant formula"), 
           multiple = TRUE
         )),
  
  column(6,
         p("Filter for a specific age range"),
         numericInput( 
           "Age", 
           "Infant Age (months)", 
           value = 6, 
           min = 0, 
           max = 12
         )),
  
  fluidRow(
    column(12,
           plotOutput("plot")),
  ),

  )
  
  

