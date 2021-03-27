

#' @param gWidget

#' @param width
#' @param height
#'
#'@export pie
pie <- function(
    gWidget
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
    gWidget$x$style <- mergeLists( gWidget$x$style, style)
  }
gWidget$width<-width
gWidget$height<-height
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(gWidget,"class")<-c("pie",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
gWidget
}
