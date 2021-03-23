

#' @param g
#'
#' @param mapping
#' @param width
#' @param height
#'
#'@export scatter
scatter <- function(
    g
    ,width=NULL
    ,height=NULL
    ,shape=NULL
) {
g$width<-width
g$height<-height
style<-list()
#shape default "circle"
if(is.null(shape)){style$shape<-'circle'}
else{
  if(!shape %in% c( 'circle',
                   'square',
                   'bowtie',
                   'diamond',
                   'hexagon',
                   'triangle',
                   'triangle-down',
                   'hollow-circle',
                   'hollow-square',
                   'hollow-bowtie',
                   'hollow-diamond',
                   'hollow-hexagon',
                   'hollow-triangle',
                   'hollow-triangle-down',
                   'cross',
                   'tick',
                   'plus',
                   'hyphen','line')){
  stop("shape is not support")}
  else{style$shape<-shape}
}
g$x$style <- mergeLists(g$x$style, style)
sizingPolicy <-htmlwidgets::sizingPolicy(viewer.padding = 10, browser.fill = TRUE)
attr(g,"class")<-c("scatter",if (sizingPolicy$viewer$suppress) "suppress_viewer","htmlwidget")
g
}


