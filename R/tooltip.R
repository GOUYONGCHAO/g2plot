
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
#' @examples
#' 
#' @return
#' @export 
tooltip<-function(gWidget
                  ,title=NULL
                  ,fields=c(NULL,NULL)	               
                  ,formatter=NULL	      
                  ,follow	 =TRUE     
                  ,enterable=FALSE	       
                  ,showTitle =NULL       
                  ,position	=c("top","bottom","left","right")      
                  ,shared =NULL  
                  ,showCrosshairs   =FALSE
                  ,crosshairs	=NULL    ##
                  ,textStyle =NULL     ##
                  ,textBackgroundStyle	 =NULL
                  ,showMarkers	 =TRUE     #
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
  
  tooltip$fields=fields
  #follow
  if (!missing(follow) && isTRUEorFALSE(follow)) {
     tooltip$follow <-follow
  }
  # enterable
 if (!missing(enterable) && isTRUEorFALSE(enterable)) {
     tooltip$enterable <-enterable
  }
  #check position
  tooltip$position <-match.arg(position)
  # shared
 if (!missing(shared) && isTRUEorFALSE(shared)){
     tooltip$shared <-shared
  }
   # shared
 if (!missing(showCrosshairs) && isTRU(showCrosshairs)) {
    tooltip$showCrosshairs <-showCrosshairs
    tooltip$crosshairs <-crosshairs
  }
  # showMarkers
 if (!missing(showMarkers) && isTRUEorFALSE(showMarkers)) {
     tooltip$showMarkers <-showMarkers
  }

  gWidget$x$tooltip<-mergeLists(gWidget$x$tooltip,tooltip)
  #return g
  gWidget
}    ##

