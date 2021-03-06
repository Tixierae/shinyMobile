context("f7Appbar")

getChildren <- function(tag) {
  tag$children[[1]]
}

getInnerChildren <- function(tag) {
  shinyMobile:::dropNulls(getChildren(tag)$children)
}

test_that("appbar", {
  expect_true(inherits(f7Appbar(), "shiny.tag"))
  expect_equal(f7Appbar()$attribs$class, "appbar")
  expect_equal(f7Appbar()$children[[1]]$attribs$class, "appbar-inner")

  expect_length(getInnerChildren(f7Appbar()), 0)
  expect_length(getInnerChildren(f7Appbar("test")), 1)

  # left toggle
  appbar <- f7Appbar(leftPanel = TRUE, rightPanel = FALSE)

  expect_length(getInnerChildren(appbar), 1)
  inner <- getInnerChildren(appbar)[[1]]
  expect_equal(inner$attribs$class, "left")
  expect_equal(inner$children[[1]]$attribs$`data-panel`, "left")

  # right panel
  appbar <- f7Appbar(leftPanel = TRUE, rightPanel = TRUE)

  expect_length(getInnerChildren(appbar), 2)
  inner <- getInnerChildren(appbar)[[2]]
  expect_equal(inner$attribs$class, "right")
  expect_equal(inner$children[[1]]$attribs$`data-panel`, "right")
})


