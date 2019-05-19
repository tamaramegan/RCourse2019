
library(ggplot2)
library(scales)
library(RColorBrewer) # package for colours

dat<-read.table("~/Google Drive/Data_analysis_in_R_for_Marine_Science/Day2_Plots_Maps_Dates/SectionPlot/ex_section_R.txt",header=T)
str(dat)
head(dat)
names(dat)

dat$date <- as.POSIXct(strptime(dat$date, format="%m/%d/%Y"))
str(dat$date) #date format POSIXct, it is necessary to plot times series with ggplot

ggplot(dat)+
  geom_point(aes(x = date, y = -depth, colour=salinity), size=2)+
  #scale_colour_gradientn(colours=brewer_pal(palette = "RdBu")(9))+
  #scale_y_continuous(limits=c(-1000,0),"Depth")+
  labs(colour="Salinity")+
  theme_bw()#+
  #scale_x_datetime("Time",breaks = date_breaks("1 month"),labels = date_format("%b"))
ggsave("SectionPlot_1.pdf")

ggplot(dat,aes(x = date, y = -depth, colour=salinity))+
  geom_point(size=2)+
  scale_colour_gradientn(colours=brewer_pal(palette = "OrRd")(9))+
  scale_y_continuous(limits=c(-800,0),"Depth (m)")+
  labs(colour="Salinity")+
  theme_bw()+
  scale_x_datetime("Time",breaks = date_breaks("1 week"),date_labels = "%d/%m")
ggsave("SectionPlot_2.pdf")


#distance chlorophyll
ggplot(dat)+
  geom_point(aes(x = profile, y = -depth, colour=chlorophyll), size=2)+
  scale_colour_gradientn(colours=brewer_pal(palette="PiYG")(9))+
  scale_y_continuous(limits=c(-1000,0),"Depth (m)")+
  labs(colour=expression(paste("chla", " ", "(" ,"mg", " ", m^-3, ")")))+
  theme_bw()
ggsave("SectionPlot_3.pdf")


