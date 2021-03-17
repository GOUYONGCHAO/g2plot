#' g2martrix 
#' g2martrix heatmap
#' 
#' @import htmlwidgets
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
#'@param  colorField
# required, string 类型
# 多折线必选。
# 数据集中的分组字段名，一般对应一个分类字段。
# 通过该字段的值，折线图将会被分为多个组，通过颜色进行区分，视觉上呈现为多条折线。

#'@param sizeField

# optional, string 类型

# 指定色块形状大小映射的字段，要求必须为一个连续字段。

#'@param shapeSize

# optional, number[ ]

# 指定色块形状大小的值域，顺序为[min,max]。

# 用法示例：

# const matrixPlot = new Matrix(document.getElementById('container'), {
#     data,
#     xField: 'name',
#     yField: 'country',
#     colorField: 'value',
#     sizeField: 'value',
#     shapeSize: [2,20]
# });
# matrixPlot.render();
#'@param shapeType

# optional, string 类型

# 指定色块形状的类型，支持设置rect和circle两种类型，默认为rect。

#'@param forceSquare

# optional, boolean 类型

# 是否强制色块形状的 width 和 height 相等。

#'@param  color

# optional, string[] | function 类型

# 指定折线颜色。如不进行配置则采用 theme 中的配色。


#'@param  tooltip

# optional 见通用图表配置。

#'@param  legend

# optional 见通用图表配置。

#'@param  label

# optional

# visible: boolean    图形标签是否显示
# type: 'point' | 'heatmap'  图形标签类型

# type 类型	表现
# type: 'point'	
# type: 'heatmap'	
# formatter: function 对 label 的显示文本进行格式化
# offsetX: number 在 label 位置的基础上再往 x 方向的偏移量
# offsetY: number 在 label 位置的基础上再往 y 方向的偏移量
# style: object 配置 label 文本样式

#'@param  events
# optional

# 图形事件：
# onheatmapClick: function  折线点击事件
# onheatmapDblClick: function    折线双击事件
# onheatmapMousemove: function  折线鼠标移动事件
# onheatmapContextmenu: function    折线右键事件

# 如配置了折线上的数据点：

# onPointClick: function  数据点点击事件
# onPointDblClick: function    数据点双击事件
# onPointMousemove: function  数据点鼠标移动事件
# onPointContextmenu: function    数据点右键事件

#' @export matrix
g2matrix <- function(
    data
    , xField = NULL
    , yField = NULL
    , colorField = NULL
    , color = NULL
    , title = ''
    , description = ''
    , width = NULL
    , height = NULL
    , forceFit = TRUE
    , padding = NULL
    , sizeField = NULL
    , shapeSize = NULL
    , shapeType = NULL
    , forceSquare = NULL
    , xAxis = NULL
    , yAxis = NULL
    , tooltip = NULL
    , legend = NULL
    , label = NULL
    , theme = NULL
    , background = NULL
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
  #for large dataset sample 10000 for plot
  if (length(data$xField) > 10000 || length(data$yField) > 10000 || length(data$colorField) > 10000) {
    data <- data[sample(nrow(data), 10000, replace = F),]
  }
  # if (!is.factor(data[xField,]) || !is.factor(data[yField,])){ stop('x y must catergroy!')}

  attrs <- list(
      xField = xField
      , yField = yField
      , colorField = colorField
      , sizeField = sizeField
      , shapeSize = shapeSize
      , shapeType = shapeType
      , title = title
      , description = description
  )
  # create widget
  g2Htmlwidget <- htmlwidgets::createWidget(
    name = 'g2matrix',
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

#' Shiny bindings for heatmap
#'
#' Output and render functions for using heatmap within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a heatmap
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name heatmap-shiny
#'
#' @export
g2matrixOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'g2martrix', width, height, package = 'g2plot')
}

#' @rdname heatmap-shiny
#' @export
renderMatrix <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  # force quoted
  htmlwidgets::shinyRenderWidget(expr, g2matrixOutput, env, quoted = TRUE)
}
