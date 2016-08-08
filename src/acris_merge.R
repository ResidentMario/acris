## ACRIS Join 
require(sqldf)

acris_legals<-read.delim('C:/Users/rzirngibl/Desktop/veteran_housing/ACRIS_-_Real_Property_Legals.csv',sep=",",header=T)
acris_master<-read.delim('C:/Users/rzirngibl/Desktop/veteran_housing/ACRIS_-_Real_Property_Master.csv',sep=",",header=T)

names(acris_legals)[1]<-'DOCUMENT_ID'
names(acris_master)[1]<-'DOCUMENT_ID'

acris<-sqldf(
  'SELECT c.*,d.BOROUGH,d.BLOCK,d.LOT
   FROM acris_master c
   LEFT JOIN acris_legals d
   ON c.DOCUMENT_ID = d.DOCUMENT_ID')

write.csv(acris,'C:/Users/rzirngibl/Desktop/acris_merged.csv',row.names=F)
