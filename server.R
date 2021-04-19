
library(shiny)
library(ggplot2)
library(caret)
library(lattice)
library(swirl)


shinyServer(function(input,output){
  mortgage <- reactive ({
    loan_amt <- input$loan_amt
    int_rate <- input$int_rate/(12*100)
    term <- input$term*12
    
    monthly_payment <- (loan_amt*int_rate)/(1-1/((1+int_rate)^term))
    monthly_payment
  })
  
  output$monthly_payment <- renderText({paste0("Monthly payment: ",
                                               prettyNum(round(mortgage(),0),big.mark=","))})
  output$total_cost_of_mortgage <- renderText({
    paste0("Total mortgage payment: ",
           prettyNum(round(mortgage()*input$term*12,0),big.mark=","))})
  output$total_interest_paid <- renderText({
    paste0("Total interest paid: ",
           prettyNum(round(mortgage()*input$term*12 - input$loan_amt,0),big.mark=","))})
})