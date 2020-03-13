#' line 
#'
#' @import htmlwidgets magrittr
#' @export %>%
#' @param  title

# optional 见通用图表配置。
#'@param description
# optional 见通用图表配置。
#'@param width
# optional 见通用图表配置。
#'@param  height
# optional 见通用图表配置。
#'@param  forceFit
# optional 见通用图表配置。
#'@param  padding
# optional 见通用图表配置。
#'@param  theme
# optional 见通用图表配置。
#'@param  data
# required
# 数据源为对象集合，例如：[{ segment: '分类一'，value: 20 }, { segment: '分类二'，value: 20 }]。
#'@param  xField
# required, string 类型
# 折线形状在 x 方向（横向延伸）对应的数据字段名，一般对应一个连续字段。
#'@param  yField
# required, string 类型
# 折线形状在 y 方向对应的数据字段名，一般对应一个离散字段。
#'@param  seriesField
# required, string 类型
# 多折线必选。
# 数据集中的分组字段名，一般对应一个分类字段。
# 通过该字段的值，折线图将会被分为多个组，通过颜色进行区分，视觉上呈现为多条折线。

#'@param  lineSize

# optional, number 类型

# 设置折线宽度，默认为 2。

#'@param  smooth

# optional, boolean 类型

# 是否将折线绘制为曲线 (spline)。

#'@param  color

# optional, string[] | function 类型

# 指定折线颜色。如不进行配置则采用 theme 中的配色。

#'@param  lineStyle

# optional, object | function 类型

# 配置折线样式。

# stroke: string  折线颜色
# lineWidth: number  折线宽度
# lineDash: number[] 虚线显示
# opacity: number  透明度

# 另外还支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象。

#'@param  point

# optional

# 配置折线上的数据点，起到辅助阅读的作用。分组及颜色映射方式与折线图形保持一致。

# visible: boolean  是否显示数据点
# shape: string  数据点形状
# size: number  数据点大小
# style: object | function  数据点样式

#'@param  xAxis

# optional 见通用图表配置。

#'@param  yAxis

# optional 见通用图表配置。

#'@param  tooltip

# optional 见通用图表配置。

#'@param  legend

# optional 见通用图表配置。

#'@param  label

# optional

# visible: boolean    图形标签是否显示
# type: 'point' | 'line'  图形标签类型

# type 类型	表现
# type: 'point'	
# type: 'line'	
# formatter: function 对 label 的显示文本进行格式化
# offsetX: number 在 label 位置的基础上再往 x 方向的偏移量
# offsetY: number 在 label 位置的基础上再往 y 方向的偏移量
# style: object 配置 label 文本样式

#'@param  events
# optional

# 图形事件：
# onLineClick: function  折线点击事件
# onLineDblClick: function    折线双击事件
# onLineMousemove: function  折线鼠标移动事件
# onLineContextmenu: function    折线右键事件

# 如配置了折线上的数据点：

# onPointClick: function  数据点点击事件
# onPointDblClick: function    数据点双击事件
# onPointMousemove: function  数据点鼠标移动事件
# onPointContextmenu: function    数据点右键事件

#' @export line
line <- function(
    data
    , xField = NULL
    , yField = NULL
    , seriesField = NULL
    , title = ''
    , description = ''
    , width = NULL
    , height = NULL
    , forceFit = TRUE
    , padding = NULL
    , lineSize = NULL
    , lineStyle = NULL
    , smooth = NULL
    , color = NULL
    , point = FALSE
    , xAxis = NULL
    , yAxis = NULL
    , tooltip = NULL
    , legend = TRUE
    , label = NULL
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
  legend <- list(visible=legend)

  attrs <- list(
      xField = xField
      , yField = yField
      , seriesField = seriesField
      , title = title
      , description = description
      , point = point
      , legend = legend
  )
  # create widget
  g2Htmlwidget <- htmlwidgets::createWidget(
    name = 'line',
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
    elementId = 'line'
  )
  g2Htmlwidget
}

#' Shiny bindings for line
#'
#' Output and render functions for using line within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a line
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name line-shiny
#'
#' @export
lineOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'line', width, height, package = 'line')
}

#' @rdname line-shiny
#' @export
renderline <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  # force quoted
  htmlwidgets::shinyRenderWidget(expr, lineOutput, env, quoted = TRUE)
}
