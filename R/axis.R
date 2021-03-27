#' @param tickMethod  tickMethod includes cat、time-cat、 wilkinson-extended、r-pretty、time、time-pretty、log、pow、quantile、d3-linear
#' @export xAxis
#'
xAxis <- function(g
                  ,
                  position = NULL
                  ,
                  label = NULL
                  ,
                  min = NULL
                  ,
                  max = NULL
                  ,
                  minLimit = NULL
                  ,
                  maxLimit = NULL
                  ,
                  tickCount = NULL
                  ,
                  tickInterval = NULL
                  ,
                  tickMethod = NULL  #cat、time-cat、 wilkinson-extended、r-pretty、time、time-pretty、log、pow、quantile、d3-linear
                  ,
                  line = NULL
                  ,
                  tickLine = NULL
                  ,
                  subTickLine = NULL
                  ,
                  title = NULL
                  ,
                  grid = NULL
                  ,
                  animate = NULL) {
  if (!is.null(g)) {
    xAxis <- list()
    # position
    if (!position %in% c("top", "bottom", "left", "right")) { stop("Axis postion must be 'top', 'bottom','left' or 'right'")
    }
    else { xAxis$position <- position
    }

    # verticalLimitLength
    # if(!is.null(verticalLimitLength)){
    #   xAxis$verticalLimitLength<-verticalLimitLength
    # }

    # label
    if (!is.null(label)) {
      xAxis$label <- label
    }
    # min
    if (!is.null(min)) {
      xAxis$min <- min
    }
    #max
    if (!is.null(max)) {
      xAxis$max <- max
    }
    # minlimit
    if (!is.null(minLimit)) {
      xAxis$minLimit <- minLimit
    }
    # maxlimit
    if (!is.null(maxLimit)) {
      xAxis$maxLimit <- maxLimit
    }
    # tickInterval
    if (!is.null(tickInterval)) {
      xAxis$tickInterval <- tickInterval
    }
    # tickCount
    if (!is.null(tickCount)) {
      xAxis$tickCount <- tickCount
    }
    #tickMethod
    if (!tickMethod %in% c("cat","time-cat","wilkinson-extended", "r-pretty","time","time-pretty","log","pow","quantile", 'd3-linear' ))
      {
      stop(
        "tickMethod must be tickMethod includes cat、time-cat、 wilkinson-extended、r-pretty、time、time-pretty、log、pow、quantile、d3-linear"
      )
    } else {
      xAxis$tickMethod <- tickMethod
    }

  if (!is.null(tickLine)) {
    xAxis$tickline <- tickLine
  }

  xAxis$stroke <- stroke
  xAxis$lineWidth <- lineWidth
  xAxis$lineDash <- c(start, end)
  # cursor
  if (!is.null(cursor) && is.boolean(cursor)) {
    xAxis$cursor <- cursor
  }
  # animate
  if (!is.null(animate)) {
    xAxis$animate <- animate
  }
  #'@todo:animateOption
  #merge xAxis to g2plot object
  g$x$xAxis <- mergeLists(g$x$xAxis, xAxis)
} else{  stop('g must be input')}
# return g
g
}
# title
title <- function(text,
                  offset,
                  spacing,
                  style,
                  autoRotate) {
  title <- list()
  title$text <- text
  title$offset <- offset
  title$spacing <- spacing
  title$style <- style
  title$autoRotate <- autoRotate
  title
}
# text	string	坐标轴标题
# offset	number	标题距离坐标轴的距离
# spacing	lineStyle	标题距离坐标轴文本的距离
# style	shapeStyle	标题文本配置项
# autoRotate	boolean	是否自动旋转

#grid function
grid <- function(line.style = linestyle(),
                 alternateColor=NULL,
                 closed=NULL,
                 alignTick=NULL) {
  grid$line.style  <- line.style
  grid$alternateColor <- alternateColor
  grid$closed <- closed
  grid$alignTick <- alignTick
  # return grid
  grid
}
