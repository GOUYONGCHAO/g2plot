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
#' @param gtype
#' @param mapping
#' @param ylab
#'
#' @import htmlwidgets
#'
#' @export
#'
#'
g <-function(data,
           gtype = 'scatter',
           mapping = aes(x=NULL,y=NULL, color=NULL, size=NULL, shape=NULL, type=NULL, meta=NULL),
           main = NULL,
           xlab = NULL,
           ylab = NULL,
           elementId = NULL,
           width = NULL,
           height = NULL)
  {
    gx <- list()
    if (!is.matrix(data) && !is.data.frame(data) && is.list(data)) {
      stop("Data type not supported yet")
    }
    gx$data <- data
    # create x (dygraph attrs + some side data)
    # add data (strip names first so we marshall as a 2d array)
    names(data) <- NULL
    gx$mapping<-mapping
    #constuct x
    gx$attrs <- list()
    gx$attrs$title <- main
    gx$attrs$xlabel <- xlab
    gx$attrs$ylabel <- ylab
    gx$attrs$labels <- names(data)
    gx$attrs$legend <- TRUE
    gx$attrs$width<-width
    gx$attrs$height<-height
    gx$tootips <- list()
    gx$labels <- list()
    gx$legend <- list()
    gx$annotation <- list()
    gx$events <- list()

    if (is.null(width) | is.null(height)) {
      gx$autofit <- TRUE
    }
    else {
      gx$autofit <- FALSE
    }
    #
    if (!gtype %in% c('scatter', 'line')) {
      stop ('plot type not supported')
    }
    # create native g2plot attrs object
    gx<-1
    width<-100
    height<-100
    elementId<-1
    gtype<-'type'
    g <- htmlwidgets::createWidget(
        name = gtype,
        x = gx,
        width = width,
        height = height,
        htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE),
        package = 'g2plot',
        elementId = elementId)
    g
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