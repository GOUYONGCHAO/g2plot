#' Title
#' mapping function just like ggplot's aes().
#'
#' @param x data mapping for x
#' @param y data mapping for y
#' @param color the colorField
#' @param size the sizeField
#' @param g g2plot object
#' @param shape   shapeFiled
#' @param group
#'
#' @return
#' @export
#'
#' @examples
#' g(data)  %>% point()%>% aes(x,y,color=z)
#'
aes <- function(gWidget,
                x,
                y=NULL,
                color = NULL,
                size = NULL,
                shape = NULL,
                group = NULL,
                label = NULL
                ) {
  mapping <- list()
  meta<-list()
  if (!missing(x)) {
    mapping$xField <- x
    if(is.numeric(eval(substitute(gWidget$x$data$a,list(a=x))))){
      eval(substitute(meta$a$type<-'cat',list(a=x)))
    }
  }
  if (!missing(y)) {
    switch (gWidget$x$attrs$plotType,
           # stock
            stock ={
              if(is.null(gWidget$x$mapping$yField))
                {mapping$yField <- c('open', 'close', 'high', 'low')}
            },
            #
            line ={
            mapping$yField <-y
            },
            {
            mapping$yField <- y
            if(is.numeric(eval(substitute(gWidget$x$data$a,list(a=y))))){
              eval(substitute(meta$a$type<-'cat',list(a=y)))
            }}
    )
    }
  if (!missing(color)) {
    if (color %in% colnames(gWidget$x$data))
    {
      mapping$colorField <- color
      mapping$color<-rainbow(length(unique(eval(substitute(gWidget$x$data$a,list(a=color))))))
      # }
    }
    else {
      mapping$color <- color
    }
  }
  if (!missing(size)) {
    if (size %in% colnames(gWidget$x$data))
    {
      mapping$sizeField <- size
      mapping$size <- c(2, 30)
    }
    else if (is.numeric(size)) {
      mapping$size <-size
    }
  }
    # label
  if(!missing(label)) {
     if (label %in% colnames(gWidget$x$data))
    {
      mapping$label <- label
    }  
  }
  if (attr(gWidget, "class")[1] %in% c('line')) {
    mapping$seriesField <- group
  }
  #merge mapping
  gWidget$x$mapping <- mergeLists(gWidget$x$mapping, mapping)
  #merge meta
  gWidget$x$meta <- mergeLists(gWidget$x$meta, meta)
  #return gWidget
  gWidget
}
