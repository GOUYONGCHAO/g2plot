
# linestyle function
#' @param stroke
#'
#' @param lineWidth
#' @param lineDash
#' @param opacity
#' @param shadowColor
#' @param shadowBlur
#' @param shadowOffsetX
#' @param shadowOffsetY
#' @param cursor
#'
#'@export
linestyle<-function(
stroke=NULL
,lineWidth=NULL
,lineDash=NULL
,opacity=NULL
,shadowColor=NULL
,shadowBlur=NULL
,shadowOffsetX=NULL
,shadowOffsetY=NULL
,cursor=NULL){
linestyle<-list()
linestyle$stroke<-stroke
linestyle$lineWidth<-lineWidth
linestyle$lineDash<-lineDash
linestyle$opacity<-opacity
linestyle$shadowColor<-shadowColor
linestyle$shadowBlur<-shadowBlur
linestyle$shadowOffsetX<-shadowOffsetX
linestyle$shadowOffsetY<-shadowOffsetY
linestyle$cursor<-cursor
# return linestyle
linestyle
}
# pointstyle function
#'@export
pointstyle<-function(){

}
#textstyle function
# fontSize	number	文字大小
# fontFamily	string	文字字体
# fontWeight	number	字体粗细
# lineHeight	number	文字的行高
# textAlign	string	设置文本内容的当前对齐方式, 支持的属性：center
# textBaseline	string	设置在绘制文本时使用的当前文本基线, 支持的属性:top
# fill	string	文字的填充色
# fillOpacity	number	文字的填充透明度
# stroke	string	文字的描边
# lineWidth	number	文字描边的宽度
# lineDash	[number,number]	描边的虚线配置，第一个值为虚线每个分段的长度，第二个值为分段间隔的距离。lineDash 设为[0,0]的效果为没有描边。
# lineOpacity	number	描边透明度
# opacity	number	文字的整体透明度
# shadowColor	string	文字阴影颜色
# shadowBlur	number	文字阴影的高斯模糊系数
# shadowOffsetX	number	设置阴影距文字的水平距离
# shadowOffsetY	number	设置阴影距文字的垂直距离
# cursor	string	鼠标样式。同 css 的鼠标样式,默认 'default'。
#' @param fontSize
#'
#' @param fontFamily
#' @param fontWeight
#' @param lineHeight
#' @param textAlign
#' @param textBaseline
#' @param fill
#' @param fillOpacity
#' @param stroke
#' @param lineWidth
#' @param lineDash
#' @param lineOpacity
#' @param opacity
#' @param shadowColor
#' @param shadowBlur
#' @param shadowOffsetX
#' @param shadowOffsetY
#' @param cursor
#'
#'@export
textstyle<-function(
fontSize=NULL
,fontFamily=NULL
,fontWeight=NULL
,lineHeight=NULL
,textAlign=NULL
,textBaseline=NULL
,fill=NULL
,fillOpacity=NULL
,stroke=NULL
,lineWidth=NULL
,lineDash=NULL
,lineOpacity=NULL
,opacity=NULL
,shadowColor=NULL
,shadowBlur=NULL
,shadowOffsetX=NULL
,shadowOffsetY=NULL
,cursor=NULL
){
textstyle<-list()
textstyle$fontSize<- fontSize
textstyle$fontFamily<- fontFamily
textstyle$fontWeight<- fontWeight
textstyle$lineHeight<- lineHeight
textstyle$textAlign<- textAlign
textstyle$textBaseline<- textBaseline
textstyle$fill<- fill
textstyle$fillOpacity<- fillOpacity
textstyle$stroke<- stroke
textstyle$lineWidth<- lineWidth
textstyle$lineDash<- lineDash
textstyle$lineOpacity<- lineOpacity
textstyle$opacity<-opacity
textstyle$shadowColor<- shadowColor
textstyle$shadowBlur<-shadowBlur
textstyle$shadowOffsetX <- shadowOffsetX
textstyle$shadowOffsetY<-shadowOffsetY
textstyle$cursor <- cursor
textstyle
}
#shapeStyle
# 属性名	类型	介绍
# fill	string	图形的填充色
# r	number	用于 point, 代表图形的半径大小
# fillOpacity	number	图形的填充透明度
# stroke	string	图形的描边
# lineWidth	number	图形描边的宽度
# lineDash	[number,number]	描边的虚线配置，第一个值为虚线每个分段的长度，第二个值为分段间隔的距离。lineDash 设为[0,0]的效果为没有描边。
# lineOpacity	number	描边透明度
# opacity	number	图形的整体透明度
# shadowColor	string	图形阴影颜色
# strokeOpacity	number	图形边框透明度
# shadowBlur	number	图形阴影的高斯模糊系数
# shadowOffsetX	number	设置阴影距图形的水平距离
# shadowOffsetY	number	设置阴影距图形的垂直距离
# cursor	string	鼠标样式。同 css 的鼠标样式，默认 'default'。

#' shape style settings
#'
#' @param fill
#' @param r
#' @param fillOpacity
#' @param stroke
#' @param lineWidth
#' @param lineDash
#' @param lineOpacity
#' @param opacity
#' @param shadowColor
#' @param strokeOpacity
#' @param shadowBlur
#' @param shadowOffsetX
#' @param shadowOffSetY
#' @param cursor
#'
#' @return
#' @export
#'
#' @examples
shapestyle<- function(fill=NULL
,r = NULL
,fillOpacity=NULL
,stroke=NULL
,lineWidth=NULL
,lineDash= NULL
,lineOpacity = NULL
,opacity=NULL
,shadowColor=NULL
,strokeOpacity = NULL
,shadowBlur = NULL
,shadowOffsetX = NULL
,shadowOffSetY=NULL
,cursor = NULL) {
shapestyle<-list()
shapestyle$fill<-fill
shapestyle$r <-r
shapestyle$fillOpacity<-fillOpacity
shapestyle$stroke<-stroke
shapestyle$lineWidth<-lineWidth
shapestyle$lineDash<- lineDash
shapestyle$lineOpacity <-lineOpacity
shapestyle$opacity<-opacity
shapestyle$shadowColor<-shadowColor
shapestyle$strokeOpacity <- strokeOpacity
shapestyle$shadowBlur <-shadowBlur
shapestyle$shadowOffsetX <- shadowOffsetX
shapestyle$shadowOffsetY<-shadowOffsetY
shapestyle$cursor <- cursor
# return
shapestyle
}
#'label sytle function
#'
#' @param type
#' @param offset
#' @param offsetX
#' @param offsetY
#' @param content
#' @param style
#' @param autoRotate
#' @param rotate
#' @param labelLine
#' @param labelEmit
#' @param layout
#' @param position
#' @param animate
#' @param formatter
#' @param autoHide
#'
#' @return
#' @export
#'
#' @examples
labelstyle<-function(
type	=NULL
,offset	 =NULL
,offsetX  =NULL
,offsetY     =NULL
,content   =NULL
,style	 =NULL
,autoRotate=NULL
,rotate= NULL
,labelLine= NULL
,labelEmit= NULL
,layout	=NULL       ##
,position	=NULL
,animate=NULL      ##       boolean
,formatter=NULL    ##
,autoHide	=NULL
)
{
labelstyle<-list()
labelstyle$offset	<-offset
labelstyle$offsetX   <-offsetX
labelstyle$offsetY     <-offsetY
labelstyle$content    <-content
labelstyle$style	  <-style
labelstyle$autoRotate <-autoRotate
labelstyle$rotate <-rotate
labelstyle$labelLine <-labelLine
labelstyle$labelEmit <-labelEmit
labelstyle$layout	 <-layout
labelstyle$position	 <-position
labelstyle$animate <-animate
labelstyle$formatter	 <-formatter
labelstyle$autoHide	 <-autoHide
# return labelstyle
labelstyle
}


# 属性名	类型	介绍
# type	string	当用户使用了自定义的 label 类型，需要声明具体的 type 类型，否则会使用默认的 label 类型渲染（饼图 label 支持 inner|outer|spider）
# offset	number	label 的偏移量
# offsetX	number	label 相对于数据点在 X 方向的偏移距离
# offsetY	number	label 相对于数据点在 Y 方向的偏移距离
# content	string | IGroup | IShape | GeometryLabelContentCallback	展示的文本内容，如果不声明则按照参与映射的第一字段的值进行显示
# style	ShapeAttrs	label 文本图形属性样式
# autoRotate	string	是否自动旋转，默认 true
# rotate	number	文本旋转角度
# labelLine	null | boolean | LabelLineCfg	用于设置文本连接线的样式属性，null 表示不展示。
# labelEmit	boolean	只对极坐标下的文本生效，表示文本是否按照角度进行放射状显示，true 表示开启，false 表示关闭
# layout	'overlap' | 'fixedOverlap' | 'limitInShape'	文本布局类型，支持多种布局函数组合使用。
# position	'top' | 'bottom' | 'middle' | 'left' | 'right'	指定当前 label 与当前图形的相对位置
# animate	boolean | AnimateOption	动画配置。
# formatter	Function	格式化函数
# autoHide	boolean	是否自动隐藏，默认 false
