#' Annotation settings for g2plot
#'
#' @param gWidget
#' @param type 图形标注类型
#' @param position 标注位置.
#' @param animate 是否进行动画.
#' @param autoAdjust 文本超出绘制区域时，是否自动调节文本方向.
#' @param style
#' @param satart
#' @param end
#' @param src  图片路径
#' @param content 文本内容
#' @param rotate
#' @param maxLength
#' @param autoEllipsis
#' @param lineLength
#' @param container
#' @param html
#' @param offsetX
#' @param offsetX
#' @param alignX
#' @param alignY
annotations<-function (gWidget
,type=c("text","line","image","region","dataMarker","dataRegion","regionFilter","shape","html")
,position=c(NA,NA)
,animate=FALSE
,autoAdjust=TRUE
,style=NULL
,start=NULL
,end=NULL
,src=NULL
,content=NULL
,rotate=NULL
,maxLength=NULL
,autoEllipsis=TRUE
,lineLength=NULL
,container=NULL
,html=NULL
,offsetX=NULL
,offsetY=NULL
,alignX=NULL
,alignY=NULL
,color=NULL
){
  # create annotations
  annotations<-list()
  type<-match.arg(type)
  # position
  if(!missing(position)){
    annotations$position<-position
  }
  # animate
  if(!missing(animate)&& isTRUEorFALSE(animate)){
    annotations$animate<-animate
  }
  # autoAdjust
   if(!missing(autoAdjust)&& isTRUEorFALSE(autoAdjust)){
    annotations$autoAdjust<-autoAdjust
  }
   # style
   if(!missing(style)){
    annotations$style<-style
  }
    # offsetX
   if(!missing(offsetX)){
    annotations$offsetX<-offsetX
  }
    # offsetY
   if(!missing(offsetY)){
    annotations$offsetY<-offsetY
  }
  annotations$type<-type
  switch(type,
  text={
      # content
    if(!missing(content)){
    annotations$content<-content
    }
      # rotate
    if(!missing(rotate)){
    annotations$rotate<-rotate
    }
     # maxlength
    if(!missing(maxLength)){
    annotations$maxLength<-maxLength
    }
    # autoEllipsis
     if(!missing(autoEllipsis)){
    annotations$autoEllipsis<-autoEllipsis
    }

  },
  line={
  # start
   if(!missing(start)){
    annotations$start<-start
  }
  # end
   if(!missing(end)){
    annotations$end<-end
  }
  },
  image={
      # src
   if(!missing(src)){
    annotations$src<-src
  }

  },
  region={
     # start
   if(!missing(start)){
    annotations$start<-start
  }
  # end
   if(!missing(end)){
    annotations$end<-end
  }
  },
  dataMarker={},
  dataRegion={
       # linelength
    if(!missing(lineLength)){
      annotations$lineLength<-lineLength
      }
  },
  regionFilter={
    # start
   if(!missing(start)){
    annotations$start<-start
  }
  # end
   if(!missing(end)){
    annotations$end<-end
  }
       # color
    if(!missing(color)){
      annotations$color<-color
      }
  },
  shape={},
  html={
        # container
    if(!missing(container)){
      annotations$container<-container
      }
           # html
    if(!missing(html)){
      annotations$html<-html
      }
      # alignX
       if(!missing(alignX)){
      annotations$alignX<-alignX
      }
      # alignY
       if(!missing(alignY)){
      annotations$alignY<-alignY
      }
  },
  )
# add it to list of annotations
  gWidget$x$annotations[[length(gWidget$x$annotations) + 1]] <- annotations
# return g
  gWidget
  }
# type ❗️	string	图形标注类型.
# position ❗️	object	标注位置.
# animate	boolean	是否进行动画.
# autoAdjust	boolean	文本超出绘制区域时，是否自动调节文本方向.
# start	array	起始位置.	line region
# end	array	结束位置.	line region
# src	string	图片路径.	image
# content	string	文本内容.	text
# lineLength	string	line 长度.	text
# container	string	自定义 HTML 图形标记的容器元素.	html
# html	string	自定义的图形标记的 HTML 元素，可为 HTML DOM 字符串，或 HTML 元素，或 html 回调函数.	html
# alignX	string	DOM 元素在 X 方向的对齐方式，用于 html. 可选值: 'left' | 'middle' | 'right'	html
# alignY	string	DOM 元素在 Y 方向的对齐方式，用于 html. 可选值: 'left' | 'middle' | 'right'
