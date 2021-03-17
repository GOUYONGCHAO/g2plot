#' Title
#'
#' @param g2plot
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
g2label<-function(g2plot
                  ,type	               ##      string	当用户使用了自定义的 label 类型，需要声明具体的 type 类型，否则会使用默认的 label 类型渲染（饼图 label 支持 inner|outer|spider）
                  ,offset=NULL	       ##       number	label 的偏移量
                  ,offsetX	 =NULL     ##       number	label 相对于数据点在 X 方向的偏移距离
                  ,offsetY=NULL	       ##       number	label 相对于数据点在 Y 方向的偏移距离
                  ,content =NULL       ##	      string | IGroup | IShape | GeometryLabelContentCallback	展示的文本内容，如果不声明则按照参与映射的第一字段的值进行显示
                  ,style	=NULL        ##       object	label 文本图形属性样式
                  ,autoRotate =NULL    ##    	  string	是否自动旋转，默认 true
                  ,rotate   =NULL      ##    	  number	文本旋转角度
                  ,labelLine	=NULL    ##       null | _boolean |object_	用于设置文本连接线的样式属性，null 表示不展示。
                  ,labelEmit =NULL     ##     	boolean	只对极坐标下的文本生效，表示文本是否按照角度进行放射状显示，true 表示开启，false 表示关闭
                  ,layout	 =NULL       ##      'overlap' | 'fixedOverlap' | 'limitInShape'	文本布局类型，支持多种布局函数组合使用。
                  ,position	 =NULL     ##       'top' | 'bottom' | 'middle' | 'left' | 'right'	指定当前 label 与当前图形的相对位置
                  ,animate	 =NULL     ##       boolean | AnimateOption	动画配置。
                  ,formatter  =NULL    ##       	Function	格式化函数
                  ,autoHide	 =NULL     ##         boolean	是否自动隐藏，默认, false
                  ){
  #check position
  if(!position%in% c("top","bottom","left","right")){
    stop("position must be 'top','bottom','left','right'")
  }
  if(!layout%in% c("overlap","fixedOverlap" ,"limitInShape")){
    stop("layout must be 'overlap','fixedOverlap','limitInShape'")
  }

#return g2plot
  g2plot
}    ##