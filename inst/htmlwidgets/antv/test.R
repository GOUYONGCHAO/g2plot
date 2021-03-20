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
