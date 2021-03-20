# g2plot
AntV g2plot for R
本包是基于antV的g2plot开发的R,便于R快速使用g2plot进行画图。

# g2plot 版本
目前使用的g2plot版本为2.3.14

# R依赖包
htmlwidgets
magrittr

### 安装包
```r
install.packages("devtools")
library(devtools)
devtools::install_github('GOUYONGCHAO/g2plot')
```
# 使用说明
包采用和ggplot相似的语法。由于ggplot的实现比较复杂，因此采用`%>%`管道函数进行画图。

### 画一个散点图
```r
x<--100:100
y<-x*x*x
z<-y+x
data<-data.frame(x=x,y=y,z=z)
#也可用g()%>% 数据映射函数aes（）%>% 图像类型函数（）%>%其他设置
g(data) %>% aes(x = "y",y = "x",color='z',size='z') %>% scatter()
```
# 鸣谢

感谢antv团队

感谢Rstudio团队

