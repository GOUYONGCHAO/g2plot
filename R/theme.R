theme<-function(gWidget
,theme='dark'
,fontFamily=NULL
,color10 = NULL
,color20=NUll
,backgroundColor=NULL
,brandColor=NULL
,paletteQualitative10=NULL
,paletteQualitative20=NULL,
...){
  if (!is.null(gWidget)) {
     theme<-list()
     if(!is.null(theme)){theme$theme<-theme}
     else theme$theme<-'dark'
     if(!is.null(fontFamily)){
       theme$fontFamily=fontFamily
     }
      if(!is.null(backgroundColor)){
       theme$backgroundColor=backgroundColor
     }
     if(!is.null(brandColor)){
       theme$brandColor=brandColor
     }
      if(!is.null(paletteQualitative10)){
       theme$paletteQualitative10=paletteQualitative10
     }
     if(!is.null(paletteQualitative20)){
       theme$paletteQualitative20=paletteQualitative20
     }
    gWidget$x$theme<-mergeLists(gWidget$x$theme, theme)
  }
# return g
gWidget
}

