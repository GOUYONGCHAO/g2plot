#'@param  title

# optional 见通用图表配置。

#'@param description

# optional 见通用图表配置。

#'@param width

# optional 见通用图表配置。

#'@param height

# optional 见通用图表配置。

#'@param forceFit

# optional 见通用图表配置。

#'@param padding

# optional 见通用图表配置。

#'@param theme

# optional 见通用图表配置。

#'@param data: collection

# required

# 数据源为对象集合，例如：[{ segment: 分类一，value: 20 }, { segment: 分类二，value: 20 }]。

#'@param angleField: string

# required

# 雷达图映射到圆周角度所对应的字段，一般为一个分类字段。

#'@param radiusField: string

# required

# 雷达图映射到半径所对应的字段，一般为一个连续字段。

#'@param radius: number

# optional

# 雷达图半径

#'@param seriesField: string

# required

# 多组雷达图必选。对雷达图进行分组的字段，一般对应一个分类字段。

# 通过该字段的值，雷达图将会被分为多个组，通过颜色进行区分，并上下重叠。

#'@param angleAxis

# optional

# 雷达图角度轴配置，通用配置详见通用图表配置

#'@param radiusAxis

# optional

# 雷达图径向轴配置，通用配置详见通用图表配置

# gridType: string  网格线样式
# gridAlternateColor: string  网格设置交替的颜色，指定一个值则先渲染奇数层，两个值则交替渲染
#'@param Line

# optional

# 雷达图上的线

# visible: boolean  是否绘制线
# style: object | function  线的样式

# stroke: string  线的颜色
# lineWidth: number  线的宽度
# lineDash: number[]  虚线
# opacity: number  透明度
# 支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象。

#'@param Area

# optional

# 雷达图上的面

# visible: boolean  是否绘制面
# style: object | function  面的样式

# fill: string 面的颜色
# opacity: number 面的透明度
# 支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象。

#'@param Point

# optional

# 雷达图上的数据点

# visible: boolean  是否显示数据点
# shape: string  数据点形状
# size: number  数据点大小
# style: object | function  数据点样式

#'@param tooltip

# optional 见通用图表配置。

# legend

# optional 见通用图表配置。

#'@param label

# optional

# visible: boolean    图形标签是否显示。
# formatter: function  对 label 的显示文本进行格式化。
# offsetX: number  在 label 位置的基础上再往 x 方向的偏移量。
# offsetY: number  在 label 位置的基础上再往 y 方向的偏移量。
# style: object 配置 label 文本

#'@param events

# optional

# 图形事件
# onAreaClick: function  区域点击事件
# onAreaDoubleClick: function    区域双击事件
# onAreaMousemove: function  区域鼠标移动事件
# onAreaContextmenu: function    区域右键事件
# 如配置了线：
# onLineClick: function  线点击事件
# onLineDoubleClick: function    线双击事件
# onLineMousemove: function  线鼠标移动事件
# onLineContextmenu: function    线右键事件
# 如配置了点：
# onPointClick: function  数据点的鼠标点击事件
# onPointDoubleClick: function    数据点的鼠标双击事件
# onPointMousemove: function  数据点鼠标移动事件
# onPointContextmenu: function    数据点右键事件
# 其他事件类型见通用图表配置。
# Modern browsers and Internet Explorer 9+ (with polyfills)
# Server-side Rendering
# Electron

#'@export radar
#' 
radar <- function(
    data
    , angleField = NULL
    , radiusField = NULL
    , radius = NULL
    ,seriesField=NULL
    ,angleAxis=NULL
    , angleField = NULL
    ,line=NULL
    ,area=NULL
    ,points=NULL
    
    ,title=''
    , description = ''
    , width = NULL
    , height = NULL
    , forceFit = TRUE
    , padding = NULL
 , color = NULL
    , tooltip = NULL
    , legend = NULL
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
  attrs <- list(
      angleField = angleField
      , radiusField = radiusField
      ,radius=radius
      , seriesField = seriesField
      , radius= radius
      , angleAxis= angleAxis
      , radiusField=radiusField
      ,line=line
      ,area=area,
      ,point=point
      , title = title
      , description = description

  )
  # create widget
  g2Htmlwidget <- htmlwidgets::createWidget(
    name = 'radar',
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

#' Shiny bindings for radar
#'
#' Output and render functions for using radar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a radar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name radar-shiny
#'
#' @export
radarOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'radar', width, height, package = 'g2plot')
}

#' @rdname radar-shiny
#' @export
renderRadar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  # force quoted
  htmlwidgets::shinyRenderWidget(expr, radarOutput, env, quoted = TRUE)
}
