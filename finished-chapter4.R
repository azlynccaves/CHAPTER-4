exdf<-data.frame(patient<-c("patient1","patient2","patient3","patient4"),IRX4<-c(11,13,2,1),OCT4<-c(10,13,4,3),PAX6<-c(1,3,10,9))
view(exdf)
exdf2<-exdf[-1]
row.names(exdf2)<-exdf$patient
view(exdf2)
stats::dist(exdf2, method="manhattan")

##  patient1 patient2 patient3
##patient2        7                  
##patient3       24       27         
##patient4       25       28        3

stats::dist(exdf2, method="euclidean")

##   patient1  patient2  patient3
##patient2  4.123106                    
##patient3 14.071247 15.842980          
##patient4 14.594520 16.733201  1.732051

as.dist(1-cor(t(exdf2)))


## patient1    patient2    patient3
##patient2 0.004129405                        
##patient3 1.988522468 1.970725343            
##patient4 1.988522468 1.970725343 0.000000000

scaled_exdf2<-scale(exdf2)
d<-stats::dist(scaled_exdf2)
hc<-stats::hclust(d,method="complete")
plot(hc)
