

#' @param g

#' @param width
#' @param height
#'
#'@export pie
pie <- function(
    g
    ,width=NULL
    ,height=NULL
    ,radius=NULL
    ,innerradius=NULL
    ,startangle=NULL
    ,endangle=NULL
) {
  if(!is.null(radius) | !is.null(innerradius) |!is.null(startangle) | !is.null(endangle)){
    style<-list()
    style$radius<-radius
    style$innerradius<-innerradius
    style$startangle<-startangle
    style$endangle<-endangle
    g$x$style <- mergeLists( g$x$style, style)
  }
g$width<-width
g$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(g,"class")<-c("pie",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
g
}
