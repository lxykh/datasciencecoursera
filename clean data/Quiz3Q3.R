# data1 = data.table( read.csv("C:/Users/Xinyi/Desktop/datasciencecoursera/clean data/getdata-data-GDP.csv",stringsAsFactors = FALSE, header =TRUE,skip=3,nrows=191))
# data1 = data1[data1!="",]
# result = data1[order(data1$Ranking, na.last = TRUE, decreasing=TRUE),]
# data1 = rename(data1,CountryCode = ID,Long.Name = Economy)
# result$Long.Name[13]
# # data1 = data.table( read.csv("C:/Users/Xinyi/Desktop/datasciencecoursera/clean data/getdata-data-GDP.csv",header =TRUE,skip=3))
# data2 = data.table(read.csv("C:/Users/Xinyi/Desktop/datasciencecoursera/clean data/getdata-data-EDSTATS_Country.csv",stringsAsFactors = FALSE))
# 
# data  = merge(data1,data2,by=c("CountryCode"),all=FALSE)
# helpsum(!is.na(unique(data$CountryCode)))
# data[order(as.numeric(data$Ranking), decreasing=TRUE), list(data$CountryCode, data$Long.Name.x, data$Long.Name.y, data$Ranking)][13]
# 
# a = quantile(data$Ranking,probs = seq(0,1,0.2))
# data$quantileGDP = cut(data$Ranking,a)
# table(data$quantileGDP,data$Income.Group)
# 
# data[, mean(Ranking, na.rm=TRUE), by=Income.Group]
# 
furl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
f = "C:/Users/Xinyi/Desktop/datasciencecoursera/clean data/housing.csv"
download.file(furl,f)
data = read.csv(f,header = TRUE)
a = strsplit(names(data),"wgtp")

b = mean(as.numeric(gsub(",","",data1$US.dollars.)),na.rm = TRUE)

grep("^United",data1$Long.Name,value = TRUE)