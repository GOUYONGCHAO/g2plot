

#' @param gWidget
#'
#' @param width
#' @param height
#' @param smooth 
#'@export line
line <- function(
    gWidget
    ,width=NULL
    ,height=NULL
    ,smooth=FALSE
) {
gWidget$x$attrs$plotType<-"line"
gWidget$width<-width
gWidget$height<-height
# smooth
if(!missing(smooth)){
   gWidget$x$attrs$smooth<-smooth
  }

sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(gWidget,"class")<-c("line",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
gWidget
}
