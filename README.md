# g2plot
AntV g2plot for R
本包是基于antV的g2plot开发的R,便于R快速使用g2plot进行画图。

#g2plot 版本
目前使用的g2plot版本为2.3.14

#R依赖包
htmlwidgets
#安装包
```r
install.packages("devtools")
library(devtools)
devtools::install_github('GOUYONGCHAO/g2plot')
```
#使用说明
包采用和ggplot相似的语法
###画一个饼图
```r
data<-data.frame(x=c(1:100),y=round(rnorm(100, mean=0, sd=1)),0)
g(data,'scatter',mapping=aes(x = "y",y = "x"))
g(data) %>% scatter(aes(x = "y",y = "x"))
```
#鸣谢

感谢antv团队

感谢Rstudio团队
