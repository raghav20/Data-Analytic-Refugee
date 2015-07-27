#library(ggplot2)

#ref$Category  <- ref$Country.Name(ref)
# load / generate your data
mydf <- read.csv("datafile.csv", stringsAsFactors=FALSE)

mydf$Category  <- mydf$Country.Code
max(mydf$X2013, na.rm = TRUE)
#mydf <- read.csv("file.csv", stringsAsFactors=FALSE)
mydf[is.na(mydf)] <- 1
for(i in names(mydf)){

if((i != colnames(mydf)[1]) && (i != colnames(mydf)[2]) && (i != colnames(mydf)[18])){

sq<-seq(0,3000000,5000)
qr<- cut(mydf[,i],sq,labels = c(1:600))
mydf[,i]<-as.numeric(qr)
}
}


#ref$old<-cut(as.numeric(ref$X2013),seq(0,3000000,5000), labels=c(1:600))

# bring your data to long format as needed by ggplot
library(reshape2)
mydf.molten <- melt(mydf, value.name="Count", variable.name="Year", na.rm=TRUE)

# plot and facet by categories
library(ggplot2)
qplot( data=mydf.molten, x = Year,y = Count, geom="bar",fill = Year, stat = "identity") + facet_wrap( "Category" ) 
 
