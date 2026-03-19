# load necessary packages
# and source your functions.R file

library(shiny)
library(tidyverse)
library(kableExtra)
library(stringr)
library(DT)
library(dplyr)
library(flextable)
library(ggrepel)
library(bslib)
library(gt)

source('functions.R')

relAbundance <- read.csv("data/genus_clean")
metadata <- read_tsv("data/metadata.tsv")

# this function defines your server logic
server <- function(input, output){
  # you will put your interactions here
  
  df <- reactiveValues(data = filtered_merged_trans)
  
  observeEvent(c(input$Age, input$select), {
    df$data <- filtered_merged_trans %>% filter(Age > input$Age, diet %in% input$select)
    
    })
  output$plot <- renderPlot({
    req(input$select)
  x_var <- input$select[1]
  
  choices <- c("Breast milk",
               "Standard infant formula", 
               "Experimental infant formula")
  
  x_label <- names(choices)[choices == x_var] 
  
  create_plot(df$data, x_var, x_label, input$Age)
  }, height = 600, width = 800)
}