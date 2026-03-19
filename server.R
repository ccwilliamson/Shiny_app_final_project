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
library(shinythemes)

source('functions.R')

relAbundance <- read.csv("data/genus_clean")
metadata <- read_tsv("data/metadata.tsv")

# this function defines your server logic
server <- function(input, output){
  # you will put your interactions here
  
  df <- reactiveValues(data = filtered_merged_trans)
  
  observeEvent(c(input$Age, input$select, input$Gender), {
    
    gender_choice <- if (length(input$Gender) == 0) c("Male","Female") else input$Gender
    
    df$data <- filtered_merged_trans %>% filter(Age == as.numeric(input$Age), diet %in% input$select, Gender %in% gender_choice)
    
    })
  output$plot1 <- renderPlot({
    req(input$select)
  x_var <- input$select[1]
  
  choices <- c("Breast milk",
               "Standard infant formula", 
               "Experimental infant formula")
  
  x_label <- names(choices)[choices == x_var] 
  
  create_plot_age(df$data, x_var, x_label, input$Age)
  }, height = 700)
  
  
################
  
  output$plot2 <- renderPlot({
    req(length(input$Gender) == 2)
    req(input$select)
    x_var <- input$select[1]
    choices <- c("Breast milk",
                 "Standard infant formula", 
                 "Experimental infant formula")
    
    x_label <- names(choices)[choices == x_var] 
    
    create_plot_gender(df$data, x_var, x_label, input$Age, input$Gender)
  }, height = 700)
}