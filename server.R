library(shiny)
library(stringr)

shinyServer(
  function(input, output) {
    output$enteredSentence <- renderText({input$sentence})
    output$reversedSentence <- renderText({
      if (input$goButton >= 1) {
        sapply(lapply(strsplit({input$sentence}, NULL), rev), paste, collapse="")
      }
    })
    
    output$histogram <- renderPlot({
      if (input$goButton >= 1) {
        if(nchar({input$sentence}) > 0) {
          
        word_lengths <- sort(sapply(strsplit({input$sentence}, " "), nchar))
        
        hist(word_lengths, 
             breaks='FD',
             col='skyblue', 
             border='darkgray', 
             xlab='Number of Characters per Word', 
             main='Histogram of Character lengths of Words in your Sentence')
        }
      }
    
    })
  }
)
