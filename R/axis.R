#' xAxis settings
#' @param gWidget
#'
#' @param position
#' @param label
#' @param min
#' @param max
#' @param minLimit
#' @param maxLimit
#' @param tickCount
#' @param tickInterval
#' @param line
#' @param tickLine
#' @param subTickLine
#' @param title
#' @param grid
#' @param animate
#' @param tickMethod  tickMethod includes cat、time-cat、 wilkinson-extended、r-pretty、time、time-pretty、log、pow、quantile、d3-linear
#'
#' @export xAxis
#'
xAxis <- function(gWidget
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
  if (!is.null(gWidget)) {
    xAxis <- list()
    # position
    if (!position %in% c("top", "bottom")) { stop("Axis postion must be 'top', 'bottom'")
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
  # animate
  if (!is.null(animate)) {
    xAxis$animate <- animate
  }
    # title
    if (!is.null(title)) {
      xAxis$title <- title
    }
      # title
    if (!is.null(grid)) {
      xAxis$grid <- grid
    }
  #'@todo:animateOption
  #merge xAxis to g2plot object
  gWidget$x$xAxis <- mergeLists(gWidget$x$xAxis, xAxis)
} else{  stop('gWidget must be input')}
# return g
gWidget
}

#' yAxis settins
#'
#' @param gWidget
#' @param position
#' @param label
#' @param min
#' @param max
#' @param minLimit
#' @param maxLimit
#' @param tickCount
#' @param tickInterval
#' @param tickMethod
#' @param line
#' @param tickLine
#' @param subTickLine
#' @param title
#' @param grid
#' @param animate
#'
#' @return
#' @export yAxis
#'
#' @examples
yAxis <- function(gWidget
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
  if (!is.null(gWidget)) {
    yAxis <- list()
    # position
    if (!position %in% c("left", "right")) { stop("Axis postion must be 'left', 'right'")
    }
    else { yAxis$position <- position
    }

    # verticalLimitLength
    # if(!is.null(verticalLimitLength)){
    #   xAxis$verticalLimitLength<-verticalLimitLength
    # }

    # label
    if (!is.null(label)) {
      yAxis$label <- label
    }
    # min
    if (!is.null(min)) {
      yAxis$min <- min
    }
    #max
    if (!is.null(max)) {
      yAxis$max <- max
    }
    # minlimit
    if (!is.null(minLimit)) {
      yAxis$minLimit <- minLimit
    }
    # maxlimit
    if (!is.null(maxLimit)) {
      yAxis$maxLimit <- maxLimit
    }
    # tickInterval
    if (!is.null(tickInterval)) {
      yAxis$tickInterval <- tickInterval
    }
    # tickCount
    if (!is.null(tickCount)) {
      yAxis$tickCount <- tickCount
    }
    #tickMethod
    if (!tickMethod %in% c("cat","time-cat","wilkinson-extended", "r-pretty","time","time-pretty","log","pow","quantile", 'd3-linear' ))
      {
      stop(
        "tickMethod must be tickMethod includes cat、time-cat、 wilkinson-extended、r-pretty、time、time-pretty、log、pow、quantile、d3-linear"
      )
    } else {
      yAxis$tickMethod <- tickMethod
    }

  if (!is.null(tickLine)) {
    yAxis$tickline <- tickLine
  }
  # animate
  if (!is.null(animate)) {
    yAxis$animate <- animate
  }
    # title
    if (!is.null(title)) {
      yAxis$title <- title
    }
      # title
    if (!is.null(grid)) {
      yAxis$grid <- grid
    }
  #'@todo:animateOption
  #merge yAxis to g2plot object
  gWidget$x$yAxis <- mergeLists(gWidget$x$yAxis, yAxis)
} else{  stop('gWidget must be input')}
# return g
gWidget
}

#' Title setting for axis
#'
#' @param text  text content for xAxis
#' @param offset
#' @param spacing
#' @param style
#' @param autoRotate
#'
#' @return
#' @export title
#'
#' @examples
title <- function(text=NULL,
                  offset=NULL,
                  spacing=NULL,
                  style=NULL,
                  autoRotate=NULL) {
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
#' Title
#'
#' @param line.style
#' @param alternateColor
#' @param closed
#' @param alignTick
#'
#' @return
#' @export grid
#'
#'
#' @examples
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
