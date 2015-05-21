#install.packages("shiny")
library(shiny)

shinyUI(navbarPage(" ",
  tabPanel(">How to use this application",
       mainPanel(
           p("This application is designed to demonstrate some of the power of Shiny and R."),
           p(""),
           strong("Instructions"),
           p("To access the application, click on the ", span(id='div1', style="font-style: italic;","'>Application' "), " menu tab above."),
           
           p("Enter a sentence of your choice within the given text box."),

           p("This same sentence is then instantly reproduced below, beneath the ", span(id='div2', style="font-style: italic;","'You entered:' ")," header."),
           p("When the ",span(id='div3', style="font-style: italic;","'Reverse Sentence' "), " button is clicked, the sentence will appear below the ",
             span(id='div4', style="font-style: italic;"," 'The reversed sentence:' "), " header with all the characters reversed."),
           p("Additionally, the application plots the word length frequencies in a histogram, which demonstrates how to render an interactive chart using shiny."),
           p(""),
           p("Enjoy using this application!")
       )
   ),
  tabPanel(">Application",
    headerPanel("Welcome to the sentence reversal and analysis app!"),
    mainPanel(
      strong("Enter a sentence in the text area:"),
      p(""),
      tags$textarea(id="sentence", rows=3, cols=40, label = "Enter a sentence"),
      tags$head(tags$style(type="text/css", "#sentence {width: 500px}")),
      p(""),
      p(""),
      actionButton("goButton", "Reverse Sentence"),

      p(""),
      strong('You entered:'),
      textOutput('enteredSentence'),
      p(""),
      strong('The reversed sentence:'),
      textOutput('reversedSentence'),
      p(""),
      
      # Show a plot of the generated distribution
      plotOutput("histogram")
    )
 )
))
