## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(reactRouter)

## ----basic--------------------------------------------------------------------
library(reactRouter)

HashRouter(
  NavLink(to = "/", "Main"),
  NavLink(to = "/analysis", "Analysis"),
  Routes(
    Route(path = "/", element = "Main content"),
    Route(path = "/analysis", element = "Analysis content")
  )
)

## -----------------------------------------------------------------------------
# code to run in a Quarto document
# example adapted from: https://github.com/remix-run/react-router/tree/dev/examples/basic
library(reactRouter)
library(htmltools)

Layout <- div(
  # A "layout route" is a good place to put markup you want to
  # share across all the pages on your site, like navigation.
  tags$nav(
    tags$ul(
      tags$li(
        reactRouter::Link(to = "/", "Home")
      ),
      tags$li(
        reactRouter::Link(to = "/dashboard", "Dashboard")
      ),
      tags$li(
        reactRouter::Link(to = "/nothing-here", "Nothing Here")
      )
    )
  ),
  tags$hr(),
  # An <Outlet> renders whatever child route is currently active,
  # so you can think about this <Outlet> as a placeholder for
  # the child routes we defined above.
  reactRouter::Outlet()
)

reactRouter::HashRouter(
  div(
    h1("Basic Example"),
    tags$p(
      paste0('This example demonstrates some of the core features of React Router
          including nested reactRouter::Route(), reactRouter::Outlet(), 
          reactRouter::Link(), and using a "*" route (aka "splat route") 
          to render a "not found" page when someone visits an unrecognized URL.'
      )
    ),
    reactRouter::Routes(
      Route(
        path = "/",
        element = Layout,
        Route(
          index = TRUE,
          element = div(
            tags$h2("Home"),
            tags$p("Home content")
          )
        ),
        Route(
          path = "dashboard",
          element = div(
            tags$h2("Dashboard"),
            tags$p("Dashboard here")
          )
        ),
        # Using path="*"" means "match anything", so this route
        # acts like a catch-all for URLs that we don't have explicit
        # routes for.
        Route(
          path = "*",
          element = div(
            tags$h2("Nothing to see here!"),
            tags$p(
              Link(to = "/", "Go to the home page")
            )
          )
        )
      )
    )
  )
)

