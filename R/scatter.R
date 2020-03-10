#' scatter 
#'
#'@import htmlwidgets
#'@param  title
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
#'@param  color
# optional, string[] | function 类型
# 指定折线颜色。如不进行配置则采用 theme 中的配色。

# 设置折线宽度，默认为 2。
#'@param  pointStyle

# optional, object | function 类型

# 配置折线样式。

# stroke: string  折线颜色
# scatterWidth: number  折线宽度
# scatterDash: number[] 虚线显示
# opacity: number  透明度

# 另外还支持回调函数的配置方式，入参为当前图形的对应数据，出参为一个样式配置对象。
#'@param  tooltip

# optional 见通用图表配置。

#'@param  legend

# optional 见通用图表配置。

#'@param  label
# optional
# 图形标签。
# visible: boolean    图形标签是否显示
# position: 'top' | 'bottom' | 'left' | 'right' | 'middle'    图形标签相对于点的位置
# formatter: function  对 label 的显示文本进行格式化。
# offsetX: number 在 label 位置的基础上再往 x 方向的偏移量。
# offsetY: number 在 label 位置的基础上再往 y 方向的偏移量。
# style: object 配置 label 文本
# adjustColor: boolean 只在label position为middle时生效。设置为true时，文本颜色会根据对应图形颜色自动调整。
# adjustPosition: boolean 只在label position为middle时生效。设置为true时，当文本显示空间不够时自动隐藏。

#'@param  quadrant
# optional

# 四象限组件。将图表区域进行象限划分，用以展示线性数据的分类趋势。

# xBaseline: number x方向上的象限分割基准线，默认数值为0
# yBaseline: number y方向上的象限分割基准线，默认数值为0
# lineStyle: object 配置象限分割线的样式
# regionStyle: object[] | Function 配置象限分割线的样式，按照象限区域依次配置，顺序为左上-左下-右上-右下。也支持以callback的方式进行配置
# label: object 为象限配置说明文本

# text: string[] | Function 配置象限文本内容，按照象限区域依次配置，顺序为左上-左下-右上-右下。也支持以callback的方式进行配置
# style: object 配置象限文本内容，按照象限区域依次配置，顺序为左上-左下-右上-右下。也支持以callback的方式进行配置
#'@param  trendline
#’optional

# optional

# 趋势线组件，为图表田间回归曲线。

# type: string 趋势线类型，支持 linear  exp  loess  log  poly  pow quad 7种 
# style: Object 配置趋势线样式
# showConfidence: boolean 是否绘制置信区间曲线
# confidenceStyle: Object 配置置信区间样式

#'@param  events
# optional

# 图形事件 onPointClick: function  点形状点击事件
# onPointDblClick: function  点形状双击事件
# onPointMouseenter: function  点形状鼠标进入事件
# onPointMouseleave: function  点形状鼠标离开事件
# onPointMousemove: function  点形状鼠标移动事件
# onPointMousedown: function  点形状鼠标按下事件
# onPointMouseup: function  点形状鼠标松开事件
# onPointContextmenu: function   点形状右键事件
# 其他事件类型见通用图表配置。

#'@export scatter
scatter <- function(
    data
    , xField = NULL
    , yField = NULL
    , colorField = NULL
    , title = ''
    , description = ''
    , width = NULL
    , height = NULL
    , forceFit = TRUE
    , padding = NULL
    , pointStyle = NULL
    , color = NULL
    , tooltip = NULL
    , legend = NULL
    , label = NULL
    , quadrant = NULL
    , trendline = NULL
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
      , colorField = colorField
      , color = color
      , title = title
      , description = description

  )
  # create widget
  g2Htmlwidget <- htmlwidgets::createWidget(
    name = 'scatter',
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

#' Shiny bindings for scatter
#'
#' Output and render functions for using scatter within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a scatter
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name scatter-shiny
#'
#' @export
scatterOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'scatter', width, height, package = 'g2plot')
}

#' @rdname scatter-shiny
#' @export
renderscatter <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  # force quoted
  htmlwidgets::shinyRenderWidget(expr, scatterOutput, env, quoted = TRUE)
}
