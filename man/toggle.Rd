% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f7-inputs.R
\name{f7Toggle}
\alias{f7Toggle}
\alias{updateF7Toggle}
\title{Framework7 toggle input}
\usage{
f7Toggle(inputId, label, checked = FALSE, color = NULL)

updateF7Toggle(
  inputId,
  checked = NULL,
  color = NULL,
  session = shiny::getDefaultReactiveDomain()
)
}
\arguments{
\item{inputId}{The id of the input object.}

\item{label}{Toggle label.}

\item{checked}{Whether the toggle is TRUE or FALSE.}

\item{color}{Toggle color.}

\item{session}{The Shiny session object.}
}
\description{
\code{f7Toggle} creates a F7 toggle switch input.

\code{updateF7Toggle} changes the value of a toggle input on the client.
}
\examples{
# f7Toggle
if(interactive()){
 library(shiny)
 library(shinyMobile)

 shinyApp(
   ui = f7Page(
    title = "My app",
    f7SingleLayout(
     navbar = f7Navbar(title = "f7Toggle"),
     f7Toggle(
      inputId = "toggle",
      label = "My toggle",
      color = "pink",
      checked = TRUE
     ),
     verbatimTextOutput("test"),
     f7Toggle(
      inputId = "toggle2",
      label = "My toggle 2"
     ),
     verbatimTextOutput("test2")
    )
   ),
   server = function(input, output) {
    output$test <- renderPrint(input$toggle)
    output$test2 <- renderPrint(input$toggle2)
   }
 )
}
# Update f7Toggle
if (interactive()) {
 library(shiny)
 library(shinyMobile)

 shinyApp(
   ui = f7Page(
     title = "My app",
     f7SingleLayout(
       navbar = f7Navbar(title = "updateF7Toggle"),
       f7Card(
         f7Button(inputId = "update", label = "Update toggle"),
         f7Toggle(
           inputId = "toggle",
           label = "My toggle",
           color = "pink",
           checked = FALSE
         ),
         verbatimTextOutput("test")
       )
     )
   ),
   server = function(input, output, session) {

     output$test <- renderPrint({input$toggle})

     observeEvent(input$update, {
       updateF7Toggle(
         inputId = "toggle",
         checked = TRUE,
         color = "green"
       )
     })
   }
 )
}
}
