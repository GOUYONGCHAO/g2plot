

#' @param g
#'
#' @param width
#' @param height
#'
#'@export line
line <- function(
    g
    ,width=NULL
    ,height=NULL
) {
g$width<-width
g$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(g,"class")<-c("line",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
g
}
