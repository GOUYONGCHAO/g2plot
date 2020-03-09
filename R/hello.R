# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

hello <- function() {
  print("Hello, world!")
}

library(htmlwidgets)
htmlwidgets::scaffoldWidget("g2plot")





income <- read.csv("~/lib/R/g2plot/data/income.csv", quote="")
devtools::uninstall()
devtools::install()
library(g2plot)
line(income,xField ='time',yField = 'rate',point = FALSE,title = '你好',description ='我爱我的中国')
population <- read.csv("~/lib/R/g2plot/data/population.csv", quote="")
p<-population[population$year=='2014',]

line(p,xField ='age',yField = 'gender_percentage',seriesField='sex',point = FALSE,title = '你好',description ='我爱我的中国')




