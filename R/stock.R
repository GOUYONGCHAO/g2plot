

#' @param gWidget

#' @param width
#' @param height
#' @examples
#' g(data) %>% stock() %>% g2plot::aes(x ="trade_date",y = "y")
#'@export stock
stock <- function(
   gWidget
  ,width=NULL
  ,height=NULL
  ,open='open'
  ,close='close'
  ,high='high'
  ,low='low'
) {
  gWidget$x$attrs$plotType<-"stock"
  gWidget$width<-width
  gWidget$height<-height
  if(!is.null(open)& !is.null(close)& !is.null(high)& !is.null(low)
  ){  gWidget$x$mapping$yField<-c(open,close,high,low)
  }
  sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
  attr(gWidget,"class")<-c("stock",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
  gWidget
}
