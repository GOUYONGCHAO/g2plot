

#' @param g 

#' @param width
#' @param height
#'
#'@export area
area <- function(
    g
    ,width=NULL
    ,height=NULL
) {
g$width<-width
g$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(g,"class")<-c("area",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
g
}
