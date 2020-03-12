#' bar 
#'
#' @import htmlwidgets


#' @param title

#' optional 见通用图表配置。

#' @param description

#' optional 见通用图表配置。

#' @param width

#' optional 见通用图表配置。

#' @param height

#' optional 见通用图表配置。

#' @param forceFit

#' optional 见通用图表配置。

#' @param padding

#' optional 见通用图表配置。

#' @param theme

#' optional 见通用图表配置。

#' @param data

#' required

#' 数据源为对象集合，例如：[{ segment: 分类一，value: 20 }, { segment: 分类二，value: 20 }]。

#' @param xField

#' required, string 类型

#' 条形在 x 方向长度映射对应的数据字段名，一般对应一个离散字段。

#' @param yField

#' required, string 类型

#' 条形在 y 方向位置映射所对应的数据字段名，一般对应一个分类字段。

#' @param colorField

#' optional, string 类型

#' 条形颜色映射对应的数据字段名。

#' @param color

#' optional, string | string[] | function 类型

#' 指定条形颜色。如不进行配置则采用 theme 中的配色。

#' @param barSize: number

#' optional, number 类型

#' 设置条形的高度为一个固定值。

#' @param barStyle

#' optional, object | function 类型

#' 配置条形样式。

#' fill: string  填充颜色
#' stroke: string  描边颜色
#' lineWidth: number  描边宽度
#' lineDash: number[]  描边虚线显示
#' opacity: number  透明度

#' 另外还支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象。

#' @param xAxis

#' optional 见通用图表配置。

#' @param yAxis

#' optional 见通用图表配置。

#' @param tooltip

#' optional 见通用图表配置。

#' @param legend

#' optional 见通用图表配置。

#' @param label

#' optional

#' visible: boolean    图形标签是否显示
#' position: 'top' | 'middle' | 'bottom'    图形标签相对于柱形的位置
#' formatter: function  对 label 的显示文本进行格式化。
#' offsetX: number 在 label 位置的基础上再往 x 方向的偏移量。
#' offsetY: number 在 label 位置的基础上再往 y 方向的偏移量。
#' style: object 配置 label 文本样式

#' @param conversionTag

#' optional


#' visible: boolean 转化率组件是否显示，默认 false。
#' size: number 转化率组件宽度，默认 80。
#' spacing: number 与条图形的间距，默认 12。
#' offset: number 相对 x 轴的偏移距离，默认 0。
#' arrow.visible: boolean 箭头图形是否显示，默认 true。
#' arrow.headSize: number 箭头图形尖的高度，默认 12。
#' arrow.style: object 箭头图形绘图属性。
#' value.visible: boolean 转化率值是否显示，默认 true。
#' value.style: object 转化率值绘图属性。
#' value.formatter: (v1, v2) => string 转化率值 formatter，用于自定义内容，v1 为上侧条的数值，v2 位下侧条的数值。

#' @param events

#' optional

#' 图形事件 onBarClick: function  条形点击事件
#' onBarDblClick: function  条形双击事件
#' onBarMousemove: function  条形鼠标移动事件
#' onBarContextmenu: function    条形右键事件
#' 其他事件类型见通用图表配置。
#' @examples 
#' data<-list(region=c('SouthernChina'','Northeast','NorthernChina','Northwest','Southwest'),sales=c(4137415.0929999948,2681567.469000001,2447301.017000004,1303124.508000002,815039.5959999998)
#' bar(data,xField='region',yField='sales')

#' @export bar
bar <- function(
    data
    , xField = NULL
    , yField = NULL
    , colorField = NULL
    , color = NULL
    , barSize = NULL
    , barStyle = NULL
    , title = ''
    , description = ''
    , width = NULL
    , height = NULL
    , forceFit = TRUE
    , padding = NULL
    , xAxis = NULL
    , yAxis = NULL
    , tooltip = NULL
    , legend = NULL
    , label = NULL
    , theme = NULL
    , conversionTag = NULL
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
  #' forward options using x
  title <- list(text = title, titleVisible = titleVisible)
  description <- list(text = description, descVisible = descVisible)

  attrs <- list(
      xField = xField
      , yField = yField
      , colorField = colorField
      , color = color
      , barSize = barSize
      , barStyle = barStyle
      , title = title
      , description = description
      , conversionTag = conversionTag
  )
  #' create widget
  g2Htmlwidget <- htmlwidgets::createWidget(
    name = 'bar',
    x = list(data = data, attrs = attrs),
    width = width,
    height = height,
    package = 'g2plot',
  #' htmlwidgets::sizingPolicy(viewer.suppress = TRUE
  #'                         , browser.fill = TRUE
  #'                         , browser.padding = 75
  #'                         , knitr.figure = FALSE
  #'                         , knitr.defaultWidth = 600
  #'                         , knitr.defaultHeight = 400),
    elementId = elementId
  )
  g2Htmlwidget
}

#' Shiny bindings for bar
#'
#' Output and render functions for using bar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a bar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name bar-shiny
#'
#' @export
barOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'bar', width, height, package = 'bar')
}

#' @rdname bar-shiny
#' @export
renderBar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  #' force quoted
  htmlwidgets::shinyRenderWidget(expr, barOutput, env, quoted = TRUE)
}
