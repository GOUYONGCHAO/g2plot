
#' Tooltip for plot
#' Tooltip, which means that when the mouse hovers over the chart or the finger clicks on a data point of the mobile device,
#' the data of the point is displayed in the form of interactive prompt information, such as the value of the point,
#' the data unit, etc.
#'
#' @param gWidget
#' @param title
#' @param fields
#' @param formatter
#' @param follow
#' @param enterable
#' @param showTitle
#' @param position
#' @param shared
#' @param showCrosshairs
#' @param crosshairs
#' @param textStyle
#' @param textBackgroundStyle
#' @param showMarkers
#' @param marker
#' @param showContent
#' @param container
#' @param containerTpl
#' @param itemTpl
#' @param domStyles
#' @param offset
#' @param customContent
#'
#' @return
#' @export tooltip
#'
#' @examples
tooltip<-function(gWidget
                  ,title=NULL
                  ,fields=NULL	               ##
                  ,formatter=NULL	       ##
                  ,follow	 =NULL     ##
                  ,enterable=FALSE	       ##
                  ,showTitle =NULL       ##
                  ,position	=c("top","bottom","left","right")        ##
                  ,shared =NULL    ##
                  ,showCrosshairs   =NULL
                  ,crosshairs	=NULL    ##
                  ,textStyle =NULL     ##
                  ,textBackgroundStyle	 =NULL
                  ,showMarkers	 =NULL     #
                  ,marker	 =NULL     ##
                  ,showContent  =NULL    ##
                  ,container	 =NULL     ##
                  ,containerTp
                  ,itemTpl
                  ,domStyles
                  ,offset
                  ,customContent
){
  tooltip<-list()
  #check position
  tooltip$position <-match.arg(position)
  
  gWidget$x$tooltip<-mergeLists(gWidget$x$tooltip,tooltip)
  #return g
  gWidget
}    ##

