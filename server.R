calculator <- function(gender,pclass,age,sibpar){
  
  if(gender=="Male"){
  sex=1
   }
  
  if(gender=="Female"){
  sex=0
  }
  
  if(pclass=="First"){
    pc=1
  }
  
  if(pclass=="Second"){
    pc=2
  }
  
  if(pclass=="Third"){
    pc=3
  }

  e <- exp(1)
  reg <- 4.995753 + (-1.156828 * pc) + (-0.038740 * age) + (-2.577260 * sex) + (-0.320312 * sibpar)
  prob <- (e^reg)/((e^reg)+1)
  prob1 <- (round(prob*100))
  eq <- paste(reg," = ","4.995753 + (-1.156828*class) + (-0.038740 * age) + (-2.577260 * sex) + (-0.320312 *sibpar)")
  eq1 <- paste(reg," = ","4.995753 + (-1.156828*",pc,") + (-0.038740 * ",age,") + (-2.577260 * ",sex,") + (-0.320312 *",sibpar,")")
  tlist <- list(prob1,round(reg,2),eq,round(exp(1)^reg,2),eq1)
  paste(tlist)
  
}






shinyServer(function(input, output) {
  
 output$text1 <- renderText({ 
 paste("You are a ",input$gender,", aged",input$age,", travelling in ",input$pclass, " Class.There are ",input$sibpar," of your siblings and parents on board with you.")
 })
  output$text2 <- renderText({  
paste("You would have had a ",calculator(input$gender,input$pclass,input$age,input$sibpar)[1]," percent chance of surviving the sinking of the Titanic.")
  })
output$text3 <- renderText({  
  paste("Your logit is ",calculator(input$gender,input$pclass,input$age,input$sibpar)[2],". It was calculated like this, with female coded as 0 and male as 1:")
})
output$text4 <- renderText({  
  calculator(input$gender,input$pclass,input$age,input$sibpar)[3]  
}) 
output$text5 <- renderText({  
  calculator(input$gender,input$pclass,input$age,input$sibpar)[5]  
})  
output$text6 <- renderText({  
  paste("Your survival odds ratio is therefore ",calculator(input$gender,input$pclass,input$age,input$sibpar)[4],",which is log natural (2.71) to the power of logit.")  
}) 
  
  
  
  
  
  
  
  })