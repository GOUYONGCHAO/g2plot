xAxis<-function(
          g 
          ,type
          ,position 
          ,label
          ,verticalFactor
          ,verticalLimitLength
          ,min
          ,max
          ,minLimit
          ,maxLimit
          ,tickCount
          ,tickInterval
          ,tickMethod
          ,line
          ,tickLine
          ,subTickLine
          ,title
          ,shapeStyle
          ,grid
          ,animat
          ,stroke
         ,lineDash,
          strokeOpacity,
          shadowColor,
          shadowBlur,
          shadowOffsetX,
          shadowOffsetY,
          cursor
          ,lineWidth
) {
if(!is.null(g)){
axis<-list()
if (!type %in% c("x", "y", "y2")) {
    stop("Axis name must be 'x', 'y', or 'y2'")
  } 

if (!position %in% c("top", "bottom", "left","right")) {
    stop("Axis postion must be 'top', 'bottom','left' or 'right'")
  } 
xAxis$stroke<-stroke
xAxis$lineWidth<-lineWidth
xAxis$lineDash<-c(start,end)
}else stop('g must be input')
#merge xAxis to g2plot object
g$x$axis$xAxis<-mergeLists(g$x$axis$xAxis,xAxis)
# return g
g
}