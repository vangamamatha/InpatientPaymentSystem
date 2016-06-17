inpatient<-read.csv(file.choose(), header = T)
View(inpatient)

# No.of diagnoses provided by each medical center.
Provider_Name <- aggregate(inpatient$Provider_Name, list(Provider_Name=inpatient$Provider_Name), length)
Provider_Name

#Based on DRG identifying the highest and lowest payments for each disease.
total<- aggregate(Average_Covered_Charges ~ Provider_Name , inpatient, FUN = sum)
total
max<-max(t$Average_Covered_Charges)
max
min<-min(t$Average_Covered_Charges)
min

#Total no.of discharges from each medical center.
totalDischarges<- aggregate(Total_Discharges~ Provider_Name, inpatient, FUN = length)
View(totalDischarges)
MAX<-max(totalDischarges$Total_Discharges)
MAX


#Total no.of medical centers in each city and state
ncity <- aggregate(Provider_Name~ Provider_City, inpatient, FUN = length)
View(ncity)
nstate<- aggregate(Provider_Name ~ Provider_State, inpatient, FUN = length)
View(nstate)

#Graphical representation of total payments of each diagnostic center.
t<- aggregate(Average_Covered_Charges ~ Provider_Name , inpatient, FUN = sum)
TOP<-sort(t$Average_Covered_Charges,decreasing = TRUE)
plot(TOP[1:10], xlab = "Provider_Name", ylab = "Average_Covered_Charges", main = "Total Payments")

#To predict from which city and on which diagnosis government is spending more money.
m<- aggregate(Average_Medicare_Payments ~ DRG_Definition+ Provider_City , inpatient, FUN = sum)
View(m)
