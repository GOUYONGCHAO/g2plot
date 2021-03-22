

#' @param g
#'
#' @param mapping
#' @param width
#' @param height
#'
#'@export heatmap
heatmap <- function(
    g
    ,width=NULL
    ,height=NULL
    ,shape=NULL
) {
g$width<-width
g$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(g,"class")<-c("heatmap",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
g
}



