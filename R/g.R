#' <Add Title>
#' g2plot function
#' <Add Description>
#' g function ,start a plot with g(),also use pipe(%>%) as data transfer.
#' @param width the width of the plot
#' @param height the height of the plot
#' @param elementId
#' @param data input data
#' @param main
#' @param xlab
#' @param gtype
#' @param ylab
#'
#' @import htmlwidgets
#' @import magrittr
#' @export g
#' @export g2r
#' @export g2plots
#'
#'
g <-function(data,
           plot_type = NULL,
           main = NULL,
           xlab = NULL,
           ylab = NULL,
           elementId = NULL,
           width = NULL,
           height = NULL)
  {

    gx <- list()
    if(!is.null(data)){
      if (!is.matrix(data) && !is.data.frame(data) && is.list(data)) {
      stop("Data type not supported yet")
     }else{
      names(data) <- NULL
      gx$data <- data
    # create x (dygraph attrs + some side data)
    # add data (strip names first so we marshall as a 2d array)
    }}
      else {
    stop('data is null')
    }
    #constuct x
    gx$attrs <- list()
    if (!is.null(plot_type)){ gx$attrs$plotType<-plot_type }
    gx$attrs$title <- main
    gx$attrs$xlabel <- xlab
    gx$attrs$ylabel <- ylab
    gx$attrs$labels <- names(data)
    gx$attrs$legend <- TRUE
    gx$attrs$width<-width
    gx$attrs$height<-height
    gx$axis <- list()
    gx$axis$xtitle<-xlab
    gx$axis$ytitle<-ylab
    gx$tootips <- list()
    gx$label <- list()
    gx$legend <- list()
    gx$annotation <- list()
    gx$events <- list()
    gx$style <- list()
    if (is.null(width) | is.null(height)) {
      gx$autofit <- TRUE
    }
    else {
      gx$autofit <- FALSE
    }
    #
  if(!is.null(plot_type)){ if (!plot_type %in% c('scatter', 'line','area','heatmap','pie','stock')) {
    stop ('Plot type not supported')
  }}
gWidget <- htmlwidgets::createWidget(
        name = plot_type,
        x = gx,
        width = width,
        height = height,
        htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE),
        package = 'g2plot',
        elementId = elementId)
gWidget
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
gOutput <-
  function(outputId,
           width = '100%',
           height = '400px') {
    htmlwidgets::shinyWidgetOutput(outputId, gtype, width, height, package = 'g2plot')
  }

#' @rdname g2plot-shiny
#' @export
renderG <-
  function(expr,
           env = parent.frame(),
           quoted = FALSE) {
    if (!quoted) {
      expr <- substitute(expr)
    } # force quoted
    htmlwidgets::shinyRenderWidget(expr, gOutput, env, quoted = TRUE)
  }

g2plot<-g
g2r<-g
