library('jsonlite')
data<-fromJSON('https://gw.alipayobjects.com/os/antfincdn/aao6XnO5pW/IMDB.json')
write.csv(data,'~/g2plot/data/IMDB.csv')
g(data) %>% aes(x = "Revenue (Millions)",y = "Rating",color='Genre',size = '4') %>% scatter()
