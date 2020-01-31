library(ggplot2)
library(dplyr)
library(ggtree)
library(treeio)
library(treedater)
library(lubridate)

# Maximum likelihood phylogenetic tree visualization with ggtree

folder = "../../"
tfile = "tree/2019nCoV_013120.tre"

tree <- read.tree(paste(folder,tfile,sep=''))
lfile = "2019-nCoV/metaData/date_location_2019nCoV.txt"
tip_location <- read.csv(paste(folder,lfile,sep=''),sep='\t',na.strings = "")


t <- ggtree(tree)# + geom_tiplab(size=3) 
t <- t %<+% tip_location + geom_tippoint(aes(color=Location), size=4) + theme(legend.position="top")
t
png("2019-nCoV_013120.png",res=100,width=600,height=900)
print(t)
dev.off()

# Bayesian temporal phylogenetic tree visualization with ggtree

bfile = "beast/2019nCov_013120_hkyr4_cons.tre"
btree <- read.beast(paste(folder,bfile,sep=''))
b <- ggtree(btree)
b <- b %<+% tip_location + geom_tippoint(aes(color=Location), size=4) + theme(legend.position="top")
b

png("2019-nCov_013120_hkyr4_cons.png",res=100,width=600,height=900)
print(b)
dev.off()



# Root-to-tip regression

folder = "../../"
tfile = "tree/2019nCoV_013120.tre"
tre <- read.tree(paste(folder,tfile,sep=''))

dfile = "2019-nCoV/metaData/date_location_2019nCoV.txt"
date_df <- read.csv(paste(folder,dfile,sep=''),sep='\t',na.strings = "")

name <- date_df[,"Name"]
date <- date_df[,"date"]

ndate = c()

for (i in 1:length(date)){
  d <- mdy(date[i])
  numdate <- decimal_date(d)
  ndate <- append(ndate, numdate)
}
sts
sts <- setNames(ndate,name)

td <- dater(tre, sts=sts, abstol = 1e-04, searchRoot = 100, s=29910, clock='strict', numStartConditions = 1)

fit = rootToTipRegressionPlot(td)

summary(fit)
