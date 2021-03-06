% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f7Menu.R
\name{f7Menu}
\alias{f7Menu}
\alias{f7MenuItem}
\alias{f7MenuDropdown}
\alias{f7MenuDropdownDivider}
\alias{updateF7MenuDropdown}
\title{Framework7 menu container}
\usage{
f7Menu(...)

f7MenuItem(inputId, label)

f7MenuDropdown(..., id = NULL, label, side = c("left", "center", "right"))

f7MenuDropdownDivider()

updateF7MenuDropdown(id, session = shiny::getDefaultReactiveDomain())
}
\arguments{
\item{...}{Slot for \link{f7MenuItem} and \link{f7MenuDropdownDivider}.}

\item{inputId}{Menu item input id.}

\item{label}{Button label.}

\item{id}{Menu to target.}

\item{side}{Dropdown opening side. Choose among \code{c("left", "center", "right")}.}

\item{session}{Shiny session object.}
}
\description{
\code{f7Menu} is a container for \link{f7MenuItem} and/or \link{f7MenuDropdown}.

\code{f7MenuItem} creates a special action button for \link{f7Menu}.

\code{f7MenuDropdown} creates a dropdown menu for \link{f7Menu}.

\code{f7MenuDropdownDivider} creates a dropdown divider for \link{f7MenuDropdown}.

\code{updateF7MenuDropdown} toggles \link{f7MenuDropdown} on the client.
}
\examples{
# Menu container
if (interactive()) {
 library(shiny)
 library(shinyMobile)
 shinyApp(
  ui = f7Page(
    title = "Menus",
    f7SingleLayout(
      navbar = f7Navbar(
        title = "f7Menu",
        hairline = FALSE,
        shadow = TRUE
      ),
      f7Button(inputId = "toggle", label = "Toggle menu"),
      f7Menu(
        f7MenuDropdown(
          id = "menu1",
          label = "Menu 1",
          f7MenuItem(inputId = "item1", "Item 1"),
          f7MenuItem(inputId = "item2", "Item 2"),
          f7MenuDropdownDivider(),
          f7MenuItem(inputId = "item3", "Item 3")
        )
      )
    )
  ),
  server = function(input, output, session) {
    observeEvent(input$toggle, {
      updateF7MenuDropdown("menu1")
    })

    observeEvent(input$item1, {
      f7Notif(text = "Well done!")
    })

    observe({
      print(input$item1)
      print(input$menu1)
    })
  }
 )
}
}
