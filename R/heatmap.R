

#' @param gWidget
#'
#' @param mapping
#' @param width
#' @param height
#'
#'@export heatmap
heatmap <- function(
    gWidget
    ,width=NULL
    ,height=NULL
    ,shape=NULL
) {
gWidget$width<-width
gWidget$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(gWidget,"class")<-c("heatmap",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
gWidget
}



