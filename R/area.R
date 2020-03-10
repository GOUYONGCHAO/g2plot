#' area
#'@param  title

#' optional 见通用图表配置。

#'@param description

#' optional 见通用图表配置。

#'@param width

#' optional 见通用图表配置。

#'@param height

#' optional 见通用图表配置。

#'@param forceFit

#' optional 见通用图表配置。

#'@param padding

#' optional 见通用图表配置。

#'@param theme

#' optional 见通用图表配置。

#'@param data

#' required

#' 数据源为对象集合，例如：[{ segment: '分类一'，value: 20 }, { segment: '分类二'，value: 20 }]。

#'@param xField

#' required, string 类型

#' 面积形状在 x 方向（横向延伸）对应的数据字段名，一般对应一个连续字段。

#'@param yField

#' required, string 类型

#' 面积形状在 y 方向对应的数据字段名，一般对应一个离散字段。

#'@param color

#' optional, string[] | function 类型

#' 指定折线颜色。如不进行配置则采用 theme 中的配色。

#'@param areaStyle

#' optional, object | function 类型

#' 配置面积样式。

#' strokeStyle: string  面积的边框颜色
#' opacity: number  透明度
#' lineWidth: number  面积区域边框线的线宽
#' lineDash: number[]  面积区域边框线的虚线配置

#' 另外还支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象。

#'@param line

#' optional, object 类型

#' 配置面积图上线，起到辅助阅读的作用。分组及颜色映射方式与面积图形保持一致。

#' visible: boolean  是否显示数据线
#' opacity: number  透明度
#' color: string  颜色
#' size: number  线宽
#' style: object | function  线图形样式，另外还支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象

#' point

#' optional, object 类型

#' 配置面积图上的数据点，起到辅助阅读的作用。分组及颜色映射方式与面积图形保持一致。

#' visible: boolean  是否显示数据点
#' shape: string  数据点形状
#' size: number  数据点大小
#' style: object | function  数据点图形样式，另外该属性还支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象

#'@param xAxis

#' optional 见通用图表配置。

#'@param yAxis

#' optional 见通用图表配置。

#'@param tooltip

#' optional 见通用图表配置。

#'@param legend

#' optional 见通用图表配置。

#'@param label

#' optional

#' visible: boolean  图形标签是否显示
#' formatter: function  对 label 的显示文本进行格式化
#' offsetX: number 在 label 位置的基础上再往 x 方向的偏移量
#' offsetY: number 在 label 位置的基础上再往 y 方向的偏移量
#' style: object 配置 label 文本

#'@param events

#' optional

#' 图形事件 onAreaClick: function 区域点击事件
#' onAreaDblclick: function 区域双击事件
#' onAreaMousemove: function 区域鼠标移动事件
#' onAreaMouseenter: function 区域鼠标进入事件
#' onAreaMouseleave: function 区域鼠标移出事件
#' onAreaMousedown: function 区域鼠标点击事件
#' onAreaMouseup: function 区域鼠标抬起事件
#' onAreaContextmenu: function 右键事件
#' 如配置了区域图上的数据点：
#' onPointClick: function  数据点点击事件
#' onPointDblClick: function 数据点双击事件
#' onPointMousemove: function 数据点鼠标移动事件
#' onPointMouseenter: function 数据点鼠标进入事件
#' onPointMouseleave: function 数据点鼠标移出事件
#' onPointMousedown: function 数据点鼠标点击事件
#' onPointMouseup: function 数据点鼠标抬起事件
#' onPointContextmenu: function 数据点右键事件
#' 如配置了区域图上的折线：
#' onLineClick: function 折线点击事件
#' onLineDblClick: function 折线双击事件
#' onLineMousemove: function 折线鼠标移动事件
#' onLineMouseenter: function 折线鼠标进入事件
#' onLineMouseleave: function 折线鼠标移出事件
#' onLineMousedown: function 折线鼠标点击事件
#' onLineMouseup: function 折线鼠标抬起事件
#' onLineContextmenu: function 折线右键事件
#' 其他事件类型见通用图表配置。


#'@export area
area <- function(
    data
    , xField = NULL
    , yField = NULL
    , title = ''
    , description = ''
    , width = NULL
    , height = NULL
    , forceFit = TRUE
    , padding = NULL
    , color = NULL
    , tooltip = NULL
    , legend = NULL
    , label = NULL
    , areaStyle = NULL
    , line = NULL
    , point = NULL
    , xAxis = NULL
    , yAxis = NULL
    , theme = NULL
    , events = NULL
    , elementId = NULL
    ) {

  if (!is.matrix(data) && !is.data.frame(data) && is.list(data)) {
    stop("Data type not supported yet")
  }
  if (!is.character(title)) {
    title <- as.character(title)
  }
  if (length(title) == 0) titleVisible = FALSE
  else titleVisible <- TRUE

  if (!is.character(description)) {
    description <- as.character(description)
  }
  if (length(description) == 0) descVisible = FALSE
  else descVisible <- TRUE
  # forward options using x
  title <- list(text = title, titleVisible = titleVisible)
  description <- list(text = description, descVisible = descVisible)
  attrs <- list(
      xField = xField
      , yField = yField
      , areaStyle = areaStyle
      , color = color
      , title = title
      , description = description

  )
  # create widget
  g2Htmlwidget <- htmlwidgets::createWidget(
    name = 'area',
    x = list(data = data, attrs = attrs),
    width = width,
    height = height,
    package = 'g2plot',
  # htmlwidgets::sizingPolicy(viewer.suppress = TRUE
  #                         , browser.fill = TRUE
  #                         , browser.padding = 75
  #                         , knitr.figure = FALSE
  #                         , knitr.defaultWidth = 600
  #                         , knitr.defaultHeight = 400),
    elementId = elementId
  )
  g2Htmlwidget
}

#' Shiny bindings for area
#'
#' Output and render functions for using area within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a area
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name area-shiny
#'
#' @export
areaOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'area', width, height, package = 'g2plot')
}

#' @rdname area-shiny
#' @export
rendeAarea <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  # force quoted
  htmlwidgets::shinyRenderWidget(expr, areaOutput, env, quoted = TRUE)
}
