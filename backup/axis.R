#' Title
#'
#' @param dygraph
#' @param name
#' @param label
#' @param valueRange
#' @param logscale
#' @param ticker
#' @param rangePad
#' @param labelWidth
#' @param labelHeight
#' @param axisHeight
#' @param axisLineColor
#' @param axisLineWidth
#' @param pixelsPerLabel
#' @param axisLabelColor
#' @param axisLabelFontSize
#' @param axisLabelWidth
#' @param axisLabelFormatter
#' @param valueFormatter
#' @param drawGrid
#' @param gridLineColor
#' @param gridLineWidth
#' @param independentTicks
#'
#' @return
#' @export
#'
#' @examples
axis <- function(g2plot,
                   type,
                 label,  ##
                 title,
                 shapeStyle,
                 grid,
                 min=NULL,
                 max=NULL,
                 minLimit=NULL,
                 maxLimit,
                 tickCount,
                 tickInterval,
                 tickMethod,
                 lineStroke,
                 lineWidth,
                 lineDash,
                 lineOpacity,
                 shadowColor,
                 tickLine,
                 subTickLine,
                 animate,
                 animateOption,
               ) {
  if (!type %in% c("x", "y", "y2")) {
    stop("Axis name must be 'x', 'y', or 'y2'")
  }
 #check position
  if(!position%in% c("top","bottom","left","right")){
    stop("position must be 'top' 'bottom','left','right'")
  }

  # copy attrs for modification
  attrs <- g2plot$x$attrs
  axis <- list()
  axis$name <- name
  axis$label <- label
  axis$options <- list()
  axis$options$valueRange <- valueRange

  if (!is.null(logscale)) {
    if (identical(name, "x")) {
      axis$options$logscale <- logscale
    } else {
      attrs$logscale <- logscale
    }
  }


  axis$options$ticker <- JS(ticker)
  if (!is.null(axisHeight)) {
    if (name == "x") {
      attrs$xAxisHeight <- axisHeight
    } else {
      stop("axisHeight is only applicable to the x axis")
    }
  }

  if (!is.null(rangePad)) {
    attrs[[sprintf("%sRangePad", axis$name)]] <- rangePad
  }

  if (!is.null(labelWidth)) {
    attrs[[sprintf("%sLabelWidth", axis$name)]] <- labelWidth
  }
  if (!is.null(labelHeight)) {
    attrs[[sprintf("%sLabelHeight", axis$name)]] <- labelHeight
  }

  axis$options$axisLineColor <- axisLineColor
  axis$options$axisLineWidth <- axisLineWidth
  if (!is.null(pixelsPerLabel)) {
    axis$options$pixelsPerLabel <- pixelsPerLabel
  }
  axis$options$axisLabelColor <- axisLabelColor
  axis$options$axisLabelFontSize <- axisLabelFontSize

  if (!is.null(axisLabelWidth)) {
    axis$options$axisLabelWidth <- axisLabelWidth
  }

  axis$options$axisLabelFormatter <- JS(axisLabelFormatter)
  axis$options$valueFormatter <- JS(valueFormatter)
  axis$options$drawGrid <- drawGrid
  axis$options$gridLineColor <- gridLineColor
  axis$options$gridLineWidth <- gridLineWidth
  axis$options$independentTicks <- independentTicks

  # label and options
  if (!is.null(axis$label)) {
    attrs[[sprintf("%slabel", axis$name)]] <- axis$label
  }
  attrs$axes[[axis$name]] <- axis$options

  # return modified dygraph
  dygraph$x$attrs <- mergeLists(dygraph$x$attrs, attrs)
  dygraph
}
