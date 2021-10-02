setwd("D:/SY vit/DS/DS HA")
# Find Boston.csv in the github repo
# Load the BostonHousing data and assign it to the variable BostonHousing 
BostonHousing <- read.csv("Boston.csv")
BostonHousing

# Displaying the internal structure of BostoonHousing Data
str(BostonHousing)

# Examine the head of the housing dataframe
head(BostonHousing)

# Data Exploration
summary(BostonHousing)

# Description
describe(BostonHousing)

# Check for any NA’s in the dataframe
library(Amelia)
missmap(BostonHousing,col=c('yellow','black'),y.at=1,y.labels='',legend=TRUE)

#Correlation plots for exploring data and seeing if there are any interaction terms
library("ggcorrplot")
corr <- round(cor(BostonHousing[, c(2:15)]), 1)
ggcorrplot(corr, p.mat = cor_pmat(BostonHousing[, c(2:15)]),
           hc.order = TRUE, type = "lower",
           color = c("#FC4E07", "white", "#00AFBB"),
           outline.col = "white", lab = TRUE)
#--------------
library(tidyverse)
library(GGally)
BostonHousing %>% ggpairs(columns = c("crim","zn","indus","nox","rm","age","dis","rad","tax","ptratio","black","lstat","medv"),upper = list(continous = wrap('cor', size = 8)))

library("PerformanceAnalytics")
chart.Correlation(BostonHousing[, c(2:15)], histogram=TRUE, pch=19)



