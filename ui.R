#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(caret)
library(lattice)
library(swirl)
shinyUI(fluidPage(
    titlePanel("Simple Mortage Caculator"),
    sidebarLayout(
        mainPanel(
            numericInput("loan_amt", label = "Mortgage Amount", value = 100000,step = 1000),
            numericInput("int_rate", label= "Interest Rate (%)", value = 3.75,step = 0.01),
            numericInput("term", label = "Mortgage Period (in years)", value = "30",step=1),
            actionButton("calc_m", "Calculate Mortgage")
        ),
        mainPanel(
                   textOutput("monthly_payment"),
                  textOutput("total_cost_of_mortgage"),
                  textOutput("total_interest_paid"))
    )
))

