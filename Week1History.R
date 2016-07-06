read.csv("hw1_data.csv")
hw1 <-read.csv("hw1_data.csv")
view(hw1)
View(hw1)
hw1[1:2,]
hw1[47,]
nrow(hw1)
hw1[nrow(hw1)-1:nrow(hw1),]
hw1[nrow(hw1),]
hw1[nrow(hw1)-1,]
hw1[nrow(hw1)-1:nrow(hw1),]
hw1[(nrow(hw1)-1):nrow(hw1),]
hw1$Ozone
hw1$Ozone[is.na(x)]
oz <- hw1$Ozone
oz[is.na(oz)]
NAoz <- oz[is.na(oz)]
attr(NAoz)
attributes(NAoz)
length(NAoz)
validOz <- oz[!is.na(oz)]
validOz
mean(validOz)
hw1[Ozone > 31 && Temp > 90]
hw1[hw1$Ozone > 31 && hw1$Temp > 90]
hw1[hw1$Ozone > 31 & hw1$Temp > 90]
hw1[hw1$Ozone > 31]
subset(hw1, Ozone > 31)
subset(hw1, Ozone > 31 & Temp > 90)
hiOzTemp <- subset(hw1, Ozone > 31 & Temp > 90)
mean(hiOzTemp$Solar.R)
month6 <- subset(hw1, Month = 6)
month6 <- subset(hw1, Month == 6)
month6
mean(month6$Temp)
month5 <- subset(hw1, Month == 5)
max(month5$Ozone)
View(month5)
View(month5)
month5Valid <- month5[!is.na(month5$Ozone)]
month5ValidOz <- month5$Ozone
month5ValidOz <- month5$Ozone[!is.na(month5$Ozone)]
mean(month5ValidOz)
max(month5ValidOz)
savehistory("~/GitHub/RProgramming/Week1History.hist")
