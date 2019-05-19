library(ggplot2)
library(scales)
library(RColorBrewer) # package for colours

#setwd("Day2_Plots/SectionPlot/")

dat<-read.table("ex_section_R.txt",header=T)
str(dat)
head(dat)
names(dat)

