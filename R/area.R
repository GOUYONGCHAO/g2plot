

#' @param g

#' @param width
#' @param height
#'
#'@export area
area <- function(
    gWidget
    ,width=NULL
    ,height=NULL
) {
  gWidget$width<-width
  gWidget$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(gWidget,"class")<-c("area",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
gWidget
}
