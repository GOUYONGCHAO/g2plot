x<--100:100
y<-x*x*x
z<-y+x
data<-data.frame(x=x,y=y,z=z)
#也可用g()%>% 图像类型（）%>% 其他函数
g(data) %>% aes(x = "y",y = "x",color='z',size='z') %>% scatter(shape = 'circle')
