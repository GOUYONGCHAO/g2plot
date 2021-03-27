

#' @param gWidget
#'
#' @param width
#' @param height
#'
#'@export line
line <- function(
    gWidget
    ,width=NULL
    ,height=NULL
) {
gWidget$x$attrs$plotType<-"line"
gWidget$width<-width
gWidget$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(gWidget,"class")<-c("line",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
gWidget
}
