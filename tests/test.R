library('jsonlite')
library(magrittr)
#scatter
data<-fromJSON('https://gw.alipayobjects.com/os/antfincdn/aao6XnO5pW/IMDB.json')
##write.csv(data,'~/g2plot/data/IMDB.csv')
g(data) %>% aes(x = "Revenue (Millions)",y = "Rating",color='Genre',size = '4') %>% scatter()
g(data,plot_type = 'scatter') %>% aes(x = "Revenue (Millions)",y = "Rating",color='Genre',size = '4')
#line
title<-title(text='this is title',offset = 100,spacing = 100,style = NULL,autoRotate = TRUE)
data<-fromJSON('https://gw.alipayobjects.com/os/bmw-prod/55424a73-7cb8-4f79-b60d-3ab627ac5698.json')
dt<-data[1:1000,]
g(dt) %>% line()%>% aes(x = "year",y = "value",group ='category')  %>%
  xAxis(position='bottom',tickMethod='cat',tickCount = 5,title = title)%>%
  yAxis(position='right',tickMethod='cat',tickCount = 10,title = title) %>%
  legend(position = 'right') %>%
  tooltip(fields = c('value','year'),shared = FALSE,title = 'value',showTitle = TRUE) %>%
  annotations(type ='line',content = 'hi',position = c('1854','69'),start = c('min', 'median'),end = c('max', 'median')) %>%
  annotations(type='regionFilter',start = c('min', 'median'),end=c('max', '0'),color='#F4664A')



g(data,plot_type = 'line') %>% aes(x = "year",y = "value",group='category')
g2r(data = dt)%>% line()%>% aes(x = "year",y = "value",group ='category')  %>% xAxis(position='bottom',tickMethod='cat',tickCount = 5,title = title)%>% yAxis(position='right',tickMethod='cat',tickCount = 10,title = title) %>%legend(position = 'right')



#area
data<-fromJSON('https://gw.alipayobjects.com/os/bmw-prod/360c3eae-0c73-46f0-a982-4746a6095010.json')
g(data) %>% area()%>% aes(x = "timePeriod",y = "value")
#heatmap
data<-fromJSON('https://gw.alipayobjects.com/os/basement_prod/a719cd4e-bd40-4878-a4b4-df8a6b531dfe.json')
data<-data[1:50,]
g(data,plot_type = 'heatmap') %>%heatmap()%>% aes(x = "Month of Year",y = "District",color = 'AQHI')
dt<-data.frame(x=rep(1:10,10),c=rep(10:1,10),z=100:1)
data<-fromJSON('https://gw.alipayobjects.com/os/bmw-prod/68d3f380-089e-4683-ab9e-4493200198f9.json')
g(data,plot_type = 'heatmap') %>%heatmap()%>% aes(x = "name",y = "country",color = 'value')
#pie
data<-data.frame(type=c('分类1','分类2','分类3','分类4','分类5','其他'),value=c(1:6))
g(data,plot_type = 'pie') %>%pie(radius = 1 )%>%g2plot::aes(x='value',y='value',color = 'type')%>% xAxis(position='bottom',tickMethod='cat')
#stock
data<-fromJSON( '/Users/gouyongchao/g2plot/data/stock.json')
data$trade_date<-as.Date(data$trade_date)
g(data,plot_type = 'stock') %>% g2plot::aes(x ="trade_date",y = "y")
g(data) %>% stock(open = "close",close = 'open',high = "high",low = 'low') %>% g2plot::aes(x ="trade_date",y = "y")
g(data) %>% stock() %>% g2plot::aes(x ="trade_date",y = "y")

#line
data<-fromJSON( 'https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json')
g2r(data = data)

missing(x)




tooltip<-function(position	=c("top","bottom","left","right")       ##
              ){
  x<-list()
  if(!missing(position)){
    x$position<-position
  }
else x$y<-position
  x
}    ##
tooltip(position = )

tooltip(position =c('top','left'))

