tooltip<-function(g
                  ,title
                  ,fields	               ##      string	当用户使用了自定义的 label 类型，需要声明具体的 type 类型，否则会使用默认的 label 类型渲染（饼图 label 支持 inner|outer|spider）
                  ,formatter=NULL	       ##       number	label 的偏移量
                  ,follow	 =NULL     ##       number	label 相对于数据点在 X 方向的偏移距离
                  ,enterable=NULL	       ##       number	label 相对于数据点在 Y 方向的偏移距离
                  ,showTitle =NULL       ##	      string | IGroup | IShape | GeometryLabelContentCallback	展示的文本内容，如果不声明则按照参与映射的第一字段的值进行显示
                  ,position	=NULL        ##       object	label 文本图形属性样式
                  ,shared =NULL    ##    	  string	是否自动旋转，默认 true
                  ,showCrosshairs   =NULL      ##    	  number	文本旋转角度
                  ,crosshairs	=NULL    ##       null | _boolean |object_	用于设置文本连接线的样式属性，null 表示不展示。
                  ,textStyle =NULL     ##     	boolean	只对极坐标下的文本生效，表示文本是否按照角度进行放射状显示，true 表示开启，false 表示关闭
                  ,textBackgroundStyle	 =NULL       ##      'overlap' | 'fixedOverlap' | 'limitInShape'	文本布局类型，支持多种布局函数组合使用。
                  ,showMarkers	 =NULL     ##       'top' | 'bottom' | 'middle' | 'left' | 'right'	指定当前 label 与当前图形的相对位置
                  ,marker	 =NULL     ##       boolean | AnimateOption	动画配置。
                  ,showContent  =NULL    ##       	Function	格式化函数
                  ,container	 =NULL     ##         boolean	是否自动隐藏，默认, false
                  ,containerTpl
                  ,itemTpl
                  ,domStyles
                  ,offset
                  ,customContent
){
  #check position
  if(!position%in% c("top","bottom","left","right")){
    stop("position must be 'top','bottom','left','right'")
  }
  if(!layout%in% c("overlap","fixedOverlap" ,"limitInShape")){
    stop("layout must be 'overlap','fixedOverlap','limitInShape'")
  }
  g$tooltip<-mergeLists(g$tooltip,tooltip)
  #return g
  g
}    ##
