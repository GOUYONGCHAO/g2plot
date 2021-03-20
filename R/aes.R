#' Title
#' mapping function like ggplot aes()
#'
#' @param x
#' @param y
#' @param color
#' @param size
#' @param g
#' @param shape
#' @param group
#'
#' @return
#' @export
#'
#' @examples
aes <- function(g,
                x,
                y,
                color = NULL,
                size = NULL,
                shape = NULL,group = NULL) {
  mapping <- list()
  if (!is.null(x)) {
    mapping$xField <- x
  }
  if (!is.null(y)) {
    mapping$yField <- y
  }
  if (!is.null(color)) {
    if (color %in% colnames(g$x$data))
    {
      mapping$colorField <- color
      #mapping$color<-colourvalues::color_values(g$x$data[,color])
    }
    else {
      mapping$color <- color
    }
  }
  if (!is.null(size)) {
    if (size %in% colnames(g$x$data))
    {
      mapping$sizeField <- size
      mapping$size <- c(2, 30)
    }
    else if (is.numeric(size)) {
      mapping$size <- abs(size)
    }
  }
  if (attr(g, "class")[1] %in% c('line')) {
    mapping$seriesField <- group
  }
  #merge mapping
  g$x$mapping <- mergeLists(g$x$mapping, mapping)
  #return g
  g
}
