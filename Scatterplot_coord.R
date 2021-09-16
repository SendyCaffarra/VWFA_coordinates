library(ggplot2)
library(gridExtra)
library(tidyverse)
library(grid)

setwd("/Users/caffarra/Documents/vwfa_review/Fig3/")
coor<-read.csv('VWFAcoord_plot.csv', header=T)

# get the table
Num <- unique(coor$Code)
Name<- unique(coor$DotName)
Paplist<-cbind(Num,Name)

# Basic scatter plot
p1<- ggplot(coor, aes(x=y, y=x, color=Contrast))+
  geom_point(size=4) +
  geom_text(label=coor$Code, hjust=1.4, vjust=1.4, size=4)+
  #geom_text(label=coor$DotName, hjust=0.5, vjust=2, size=2)+
  scale_x_reverse()+
  #scale_y_reverse()+
  xlab("Anterior-Posterior")+
  ylab("Lateral-Mesial")+
  ggtitle("VWFA coordinates")+
  theme_bw(base_size=16) +
  theme(plot.title = element_text(hjust = 0.5, size=20, face='bold'))

p2<-p1 + scale_color_manual(values=c("#fd7c6e", "#45cea2", "#17806d")) 

# table
mytheme <- gridExtra::ttheme_default(
  core = list(padding = unit(c(2.5, 2.5), "mm")))
tbl <- tableGrob(Paplist, theme = mytheme, rows = NULL)

# combine the plot and the table
cowplot::plot_grid(p2, tbl, nrow = 1, ncol = 2, rel_widths = c(3, 1) )


