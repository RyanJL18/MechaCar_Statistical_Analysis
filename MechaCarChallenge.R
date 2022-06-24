#### Deliverable 1 ####

# load in packages
library(dplyr)

library(tidyverse)

# importing csv  file
MechaCar_mpg <- read.csv(file='C:/Users/ryanl/Documents/Good Class Folder/MechaCar_Statistical_Analysis/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar_mpg)

# linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg)

# summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg))


#### Deliverable 2 ####

# import csv as a table 
suspension_coil <- read.csv(file='C:/Users/ryanl/Documents/Good Class Folder/MechaCar_Statistical_Analysis/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
# stat summary as summarize()
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
# stat summary as group_by()
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep')


#### Deliverable 3 ####

# t-test for all the lots, mean of 1500 PSI
t.test(suspension_coil$PSI,mu=mean(suspension_coil$PSI))
# t-test for lot 1
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot1"),mu=mean(suspension_coil$PSI))
# t-test for lot 2
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot2"),mu=mean(suspension_coil$PSI))
# t-test for lot 3
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot3"),mu=mean(suspension_coil$PSI))