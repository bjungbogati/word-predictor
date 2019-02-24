
library(shiny)

suppressPackageStartupMessages({
  library(tidyverse)
  library(stringr)
})

# setwd("/home/bjungbogati/Desktop/Data Science/Courses/Coursera/RDataScience/Capstone/Project/app")

# source ngram matching function

source("ngram.R")

# define UI for application that draws a histogram

ui <- shinyUI(fluidPage(
  
  navbarPage(inverse=TRUE, 
             "Data Science Capstone",
  
  # Application title
  
  tabPanel("Word Prediction App", 
           
           # Sidebar with a slider input for number of bins
           
           sidebarLayout(
             sidebarPanel(
               h3("Things to know :"), 
               h5("1. Enter word in textbox."),
               h5("2. Predicted word appears in green"),
               h5("3. Question mark means no prediction"),
               strong("Disclaimer : Prediction mayn't work properly because of sample set of training data"),
               br()
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               tabsetPanel(
                 tabPanel("predict",
                          textInput("user_input", h3("Input your words:"), 
                                    value = ""),
                          h3("Predicted Word:"),
                          h4(em(span(textOutput("ngram_output"), style="color:green")))),
                 
                 tabPanel("top 4-words",
                          br(),
                          img(src = "quadgrams.png", height = 500, width = 700)),
                 
                 tabPanel("top 3-words",
                          br(),       
                          img(src = "trigrams.png", height = 500, width = 700)),
                 
                 tabPanel("top 2-words",
                          br(),
                          img(src = "bigrams.png", height = 500, width = 700))
               ),  br(),  br(),  img(src = "capstone-cover.png", height = 40, width = 400)
             )
           )), 
  tabPanel("About",
           fluidRow(includeMarkdown("./www/about.md")))
  )
  
))
  
  
  






