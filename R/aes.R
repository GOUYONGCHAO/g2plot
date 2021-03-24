#' Title
#' mapping function like ggplot aes()
#'
#' @param x data mapping for x
#' @param y data mapping for y
#' @param color the colorField
#' @param size the sizeField
#' @param g
#' @param shape   shapeFiled
#' @param group
#'
#' @return
#' @export
#'
#' @examples
#' g(data) %>% aes(x,y,color=z) %>% point()
#'
aes <- function(g,
                x,
                y,
                color = NULL,
                size = NULL,
                shape = NULL,group = NULL) {
  mapping <- list()
  meta<-list()
  if (!is.null(x)) {
    mapping$xField <- x
    if(is.numeric(eval(substitute(g$x$data$a,list(a=x))))){

      eval(substitute(meta$a$type<-'cat',list(a=x)))
    }
  }
  if (!is.null(y)) {
    mapping$yField <- y
    if(is.numeric(eval(substitute(g$x$data$a,list(a=y))))){
      eval(substitute(meta$a$type<-'cat',list(a=y)))
    }
  }
  if (!is.null(color)) {
    if (color %in% colnames(g$x$data))
    {
      mapping$colorField <- color
      mapping$color<-rainbow(length(unique(eval(substitute(g$x$data$a,list(a=color))))))
      # }
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
      mapping$size <-size
    }
  }
  if (attr(g, "class")[1] %in% c('line')) {
    mapping$seriesField <- group
  }
  #merge mapping
  g$x$mapping <- mergeLists(g$x$mapping, mapping)
  #merge mapping
  g$x$meta <- mergeLists(g$x$meta, meta)
  #return g
  g
}
