# g2plot

AntV g2plot for R 本包是基于antV的g2plot开发的R,便于R快速使用g2plot进行画图。

# g2plot 版本

目前使用的g2plot版本为2.3.14，详细接口文档请参见：[g2plot官方文档](https://g2plot.antv.vision/zh/docs/manual/introduction)    

# R依赖包

htmlwidgets magrittr

### 安装包

``` r
install.packages("devtools")
library(devtools)
devtools::install_github('GOUYONGCHAO/g2plot')
```

# 使用说明

包采用和ggplot相似的语法。由于ggplot的实现比较复杂，因此采用`%>%`管道函数进行画图。

### 画一个散点图

``` r
x<--100:100
y<-x*x*x
z<-y+x
data<-data.frame(x=x,y=y,z=z)
#也可用g()%>% 数据映射函数aes（）%>% 图像类型函数（）%>%其他设置
g(data) %>% aes(x = "y",y = "x",color='z',size='z') %>% scatter()
```
```r
g(stock) %>% stock() %>% g2plot::aes(x ="trade_date",y = "y")
```
## 图形设置
### legend 图例
通过添加legend()实现，可以设置legend的位置，类型等等。
```r
data<-data.frame(type=c('分类1','分类2','分类3','分类4','分类5','其他'),value=c(1:6))
g(data,plot_type = 'pie') %>%pie(radius = 1 )%>%g2plot::aes(x='value',y='value',color = 'type') %>%legend(position = 'left',layout = 'vertical')
```

![image](https://github.com/GOUYONGCHAO/g2plot/blob/master/public/image/stock.png)

## 任务清单 TODO
- [x] Line：折线图
- [x] Area：面积图
- [ ] Column：柱状图
- [ ] Bar：柱状图
- [x] Pie：饼图、环图
- [x] Scatter:散点、气泡图
- [x] Heatmap：热力图
- [ ] Sankey：桑基图
- [ ] Treemap：矩形树图
- [ ] Radar：雷达图
- [ ] BarFunnel：漏斗图
- [ ] Waterfall：瀑布图
- [ ] WordCloud：词云图
- [ ] Histogram：直方图
- [ ] Sunburst：旭日图
- [ ] BidirectionalBar：对称条形图
- [ ] RadialBar：玉珏图
- [ ] Box：箱型图
- [x] Stock：股票图

# 鸣谢

感谢antv团队

感谢Rstudio团队
