

#' @param g
#'
#' @param mapping
#' @param width
#' @param height
#'
#'@export scatter
scatter <- function(
    g
    ,mapping=aes(x,y,color=NULL, size=NULL, shape=NULL, type=NULL, meta=NULL)
    ,width=NULL
    ,height=NULL
) {
  # return modified g
#if(!is.null(attrs)){g$x$attrs <- mergeLists(g$x$attrs, attrs)}
if(!is.null(mapping)){
  g$x$mapping<-mergeLists(g$x$mapping,mapping)
  }
g$width<-width
g$height<-height
attr(g,"class")[[1]]<-"scatter"
g
}
