

#' @param g

#' @param width
#' @param height
#'
#'@export stock
stock <- function(
  g
  ,width=NULL
  ,height=NULL
  ,open='open'
  ,close='close'
  ,high='high'
  ,low='low'
) {
  g$x$attrs$plotType<-"stock"
  g$width<-width
  g$height<-height
  if(!is.null(open)& !is.null(close)& !is.null(high)& !is.null(low)
  ){  g$x$mapping$yField<-c(open,close,high,low)
  }
  sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
  attr(g,"class")<-c("stock",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
  g
}
