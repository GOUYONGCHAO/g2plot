library('jsonlite')
data<-fromJSON('https://gw.alipayobjects.com/os/antfincdn/aao6XnO5pW/IMDB.json')
##write.csv(data,'~/g2plot/data/IMDB.csv')
g(data) %>% aes(x = "Revenue (Millions)",y = "Rating",color='Genre',size = '4') %>% scatter()
g(data,plot_type = 'scatter') %>% aes(x = "Revenue (Millions)",y = "Rating",color='Genre',size = '4')

#line
data<-fromJSON('https://gw.alipayobjects.com/os/bmw-prod/55424a73-7cb8-4f79-b60d-3ab627ac5698.json')

g(data) %>% line()%>% aes(x = "year",y = "value",group ='category')

g(data,plot_type = 'line') %>% aes(x = "year",y = "value",group='category')

library(magrittr)

data<-fromJSON('https://gw.alipayobjects.com/os/bmw-prod/360c3eae-0c73-46f0-a982-4746a6095010.json')
g(data) %>% area()%>% aes(x = "timePeriod",y = "value")

data<-fromJSON('https://gw.alipayobjects.com/os/basement_prod/a719cd4e-bd40-4878-a4b4-df8a6b531dfe.json')
data<-data[1:50,]
g(data,plot_type = 'heatmap') %>%heatmap()%>% aes(x = "Month of Year",y = "District",color = 'AQHI')
dt<-data.frame(x=rep(1:10,10),c=rep(10:1,10),z=100:1)

g(dt,plot_type = 'heatmap') %>%heatmap()%>% aes(x = "x",y = "c",color = 'z',)
??aes

data<-fromJSON('https://gw.alipayobjects.com/os/bmw-prod/68d3f380-089e-4683-ab9e-4493200198f9.json')
g(data,plot_type = 'heatmap') %>%heatmap()%>% aes(x = "name",y = "country",color = 'value')


dt<-data.frame(x=rep(1:10,10),c=rep(10:1,10),z=100:1)
a<-'x'
substitute(a)
dt[substitute(a),]
dt[a,]
dt$substitute(a)
dt[1,]
dt$sym(a)

dt$substitute(a)

eval(expression(dt$a))

eval(substitute(g$x$dt$a, list(a = 'c')))

bquote(dt$.(a))

x<-'c'
g<-list()
g$x$dt<-dt
g$x$dt
ff(g,x)
substitute(g$x$dt$a,list(a=x))

is.numeric(g$x$dt$c)

g$x$data$c


eval(substitute(is.numeric(g$x$dt$a)),list(a='c'))

ff(g,x)
g$x$dt$c
aes <- function(dt,x) {
  g<-eval(substitute(dt$a, list(a = x)))
  g
  }
aes(dt,"c")



mapping <- list()
if (!is.null(x)) {
  mapping$xField <- x

  if(eval(substitute(is.numeric(g$x$data[a]),list(a=x)))){
    meta<-list()
    meta$x$type<-'cat'
  }
}
x<-'z'
if (eval(substitute(is.numeric(dt$a),list(a=x)))){
  meta<-list()
  meta$x$type<-'cat'
}


is.numeric(dt$z)

data=cbind(a=c(rep("c",100)),dt)



