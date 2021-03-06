#' Legend settings for g2plot
#'
#' @param gWidget object for g2plot
#' @param layout layout for legend
#' @param title
#' @param position
#' @param offsetX
#' @param offsetY
#' @param background
#' @param flipPage
#' @param itemWidth
#' @param itemHeight
#' @param itemName
#' @param itemValue
#' @param itemSpacing
#' @param animate
#' @param animateOptio
#' @param label
#' @param marker
#' @param maxWidth
#' @param maxHeight
#' @param rail
#' @param reversed
#' @param min
#' @param max
#' @param value
#' @param slidable
#' @param track
#' @param handler
#' @param custom
#' @param items
#'
#' @return
#' @export
#'
#' @examples
#' data<-data.frame(type=c('分类1','分类2','分类3','分类4','分类5','其他'),value=c(1:6))
#' g(data,plot_type = 'pie') %>%pie(radius = 1 )%>%g2plot::aes(x='value',y='value',color = 'type') %>%legend(position = 'left',layout = 'vertical')
#' @export
legend<-function (gWidget
,legend=TRUE
,layout			 =NULL    ##						string									horizontal				图例的布局方式，可选项：horizontal | vertical
,position		 =NULL    ##		string				-				图例的位置。详见 position 配置
,title			=NULL      ## object				-				图例标题配置，默认不展示。详见 title 配置
,offsetX		=NULL      ##	number				-				图例 x 方向的偏移。
,offsetY		=NULL      ##	number				-				图例 y 方向的偏移。
,background	 =NULL    ##			object				-				背景框配置项。详见 background 配置
,flipPage		 =NULL    ##		boolean				false				当图例项过多时是否进行分页。				分类图例
,itemWidth	=NULL      ##		number | null				null				图例项的宽度, 默认为 null（自动计算）。				分类图例
,itemHeight	 =NULL    ##			number | null				null				图例的高度, 默认为 null。				分类图例
,itemName		 =NULL    ##		object				-				图例项 name 文本的配置。详见 itemName 配置				分类图例
,itemValue	=NULL      ##		object				-				图例项 value 附加值的配置项。详见 itemValue 配置。				分类图例
,itemSpacing=NULL      ##			number				-				控制图例项水平方向的间距				分类图例
,animate		=NULL      ##	 boolean				-				是否开启动画开关。
,animateOptio=NULL			##	object				-				动画参数配置，当且仅当 animate 属性为 true，即动画开启时生效，详见 animateOption 配置
,label			 =NULL      ##	  object				-				文本的配置项。详见 label 配置				分类图例
,marker		   =NULL    ##		object				-				图例项的 marker 图标的配置。				分类图例
,maxWidth	   =NULL    ##			number				-				图例项最大宽度设置。				分类图例
,maxHeight	 =NULL      ##			number				-				图例项最大高度设置。				分类图例
,rail			   =NULL    ##	  object				-				图例滑轨（背景）的样式配置项。详见 rail 配置				分类图例
,reversed	   =NULL    ##			boolean				-				是否将图例项逆序展示。				分类图例
,min				 =NULL      ## number				-				范围的最小值。				连续图例
,max			   =NULL      ##	number				-				选择范围的最大值。				连续图例
,value			 =NULL      ##	number[]				-				选择的值。				连续图例
,slidable	   =NULL    ##			boolean				-				滑块是否可以滑动。				连续图例
,track			 =NULL      ##	 object				-				选择范围的色块样式配置项。详见 track 配置				连续图例
,handler		 =NULL      ##		object				-				滑块的配置项。详见 handler 配置				连续图例
,custom		   =NULL    ##		boolean				false				是否为自定义图例，当该属性为 true 时，需要声明 items 属性。
,items			 =NULL      ##	 object[]				-				用户自己配置图例项的内容。详见 items 配置        ##
){
  if(!is.null(gWidget)){
    legend<-list()
    if(!is.null(legend)){legend$legend<-legend}
    else legend$legend <-TRUE
    if(!is.null(layout)){
      if(!layout%in% c('horizontal','vertical')){stop('layout must be "horizontal" or "vertical" ')}
       legend$layout <-layout
    }
     if(!is.null(position)){
      if(!position%in% c('top','top-left','top-right','right','right-top','right-bottom','left','left-top','left-bottom','bottom','bottom-left','bottom-right'))
      {
        stop("position must be 'top','top-left','top-right','right','right-top','right-bottom','left','left-top','left-bottom','bottom','bottom-left','bottom-right")}
        legend$position <-position
    }
    #title
     if(!is.null(title)){
        legend$title <-title
    }
    # offsetX
  if(!is.null(offsetX)){
  if(!is.numeric(offsetX)){
    stop("offsetX must be numeric")
  }else {
     label$offsetX<-offsetX
  }}
  #offsetY
    if(!is.null(offsetY)){
  if(!is.numeric(offsetY)){
    stop("offsetY must be numeric")
  }else {
     label$offsetY<-offsetY
  }}

gWidget$x$legend<- mergeLists(gWidget$x$legend, legend)
# return g
gWidget
  }

}
