#' <Add Title>
#'
#' <Add Description>
#'
#' @param width
#' @param height
#' @param elementId
#' @param data
#' @param main
#' @param xlab
#' @param ylab
#' @param group
#' @param autofit
#'
#' @import htmlwidgets
#'
#' @export
#'
#'
g2plot <- function(data,
                   main = NULL,
                   xlab = NULL,
                   ylab = NULL,
                   group = NULL,
                   elementId = NULL,
                   width = NULL,
                   height = NULL,
                   autofit=NULL)
  {
  if( is.null(width) | is.null(height) ){
  autofit<-TRUE
  else autofit<-FALSE
  }
  # create native g2plot attrs object
  attrs <- list()
  attrs$title <- main
  attrs$xlabel <- xlab
  attrs$ylabel <- ylab
  attrs$labels <- names(data)
  attrs$legend <- TRUE
  attrs$autoFit <- autofit
  # create x (dygraph attrs + some side data)
  x <- list()
  x$data <- data
  # add data (strip names first so we marshall as a 2d array)
  names(data) <- NULL
  x$attrs <- attrs
  x$tootips <- list()
  x$labels<-list()
  x$legend<-list()
  x$annotation<-list()
  x$events <- list()
  attr(x, "data") <- data

  ##create widget
  htmlwidgets::createWidget(
    name = 'g2plot',
    x,
    width = width,
    height = height,
    htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE),
    package = 'g2plot',
    elementId = elementId
  )
}
#' Shiny bindings for g2plot
#'
#' Output and render functions for using g2plot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a g2plot
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name g2plot-shiny
#'
#' @export
g2plotOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'g2plot', width, height, package = 'g2plot')
}

#' @rdname g2plot-shiny
#' @export
renderG2plot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, g2plotOutput, env, quoted = TRUE)
}



