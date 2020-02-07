library(ggplot2)
library(dplyr)
library(ggtree)
library(treeio)
library(treedater)
library(lubridate)
library(ggthemes)

# Maximum likelihood phylogenetic tree visualization with ggtree

folder = "../../"
tfile = "tree/RAxML_bestTree_tempest.2019nCoV_020720_aln.tre"

tree <- read.tree(paste(folder,tfile,sep=''))
lfile = "2019-nCoV/metaData/date_location_2019nCoV.txt"
tip_location <- read.csv(paste(folder,lfile,sep=''),sep='\t',na.strings = "")


t <- ggtree(tree)# + geom_tiplab(size=3) 
t <- t %<+% tip_location + geom_tippoint(aes(color=Location), size=4) + theme(legend.position="top")
t
png("2019-nCoV_020720_tempest.png",res=100,width=600,height=900)
print(t)
dev.off()

# Root-to-tip regression: data from Tempest

folder = "../../"
tempfile = "tree/2019nCoV_020720_tempest_data.txt"
df <- read.csv(paste(folder,tempfile,sep=''),sep='\t',na.strings = "")

r2t <- df %>% 
  ggplot(aes(x=date,y=distance,color=location))+
  geom_point() + theme_minimal()+
  ylab("root-to-tip divergence") + xlab("time") + 
  stat_smooth(method = "lm", se = FALSE, fullrange=TRUE,alpha=0.5,color="#ff726f",size=0.5, show.legend = TRUE) + 
  scale_x_continuous(limits =c(19.85,20.11)) +
  scale_y_continuous(limits =c(-0.00000,0.0004)) +
  theme(legend.position = "none", panel.border = element_rect(colour = "black", fill=NA, size=1))
r2t
png("2019-nCov_020720_root_to_tip.png",res=100,width=600,height=600)
print(r2t)
dev.off()


######
#Unused code
######
#Unused code
######
#Unused code
######

# Root-to-tip regression with treedater

#folder = "../../"
#tfile = "tree/2019nCoV_013120.tre"
#tre <- read.tree(paste(folder,tfile,sep=''))

#dfile = "2019-nCoV/metaData/date_location_2019nCoV.txt"
#date_df <- read.csv(paste(folder,dfile,sep=''),sep='\t',na.strings = "")

#name <- date_df[,"Name"]
#date <- date_df[,"date"]

#ndate = c()

#for (i in 1:length(date)){
#  d <- mdy(date[i])
#  numdate <- decimal_date(d)
#  ndate <- append(ndate, numdate)
#}
#sts
#sts <- setNames(ndate,name)

#td <- dater(tre, sts=sts, abstol = 1e-04, searchRoot = 100, s=29910, clock='strict', numStartConditions = 1)

#fit = rootToTipRegressionPlot(td)

#summary(fit)
