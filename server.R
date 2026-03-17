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
  
  
}
