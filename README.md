# MechaCar_Statistical_Analysis

## Overview

The goal of this project was to perform multiple linear regression analyses on data provided from AutosRUs’, a car manufacturing company
### Deliverable 1:
## Linear Regression to Predict MPG

The MechaCar_mpg.csv dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. Using your knowledge of R, you’ll design a linear model that predicts the mpg of MechaCar prototypes using several variables from the MechaCar_mpg.csv file. Then, you’ll write a short interpretation of the multiple linear regression results in the README.md.

```
# linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg)

# summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg))
```

![Linear_Regression.png](https://github.com/RyanJL18/MechaCar_Statistical_Analysis/blob/main/Resources/Linear_regression_model_summary.png)

### Deliverable 2:
## Summary Statistics on Suspension Coils

The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. Using your knowledge of R, you’ll create a summary statistics table to show:

The suspension coil’s PSI continuous variable across all manufacturing lots
The following PSI metrics for each lot: mean, median, variance, and standard deviation.

```
# import csv as a table 
suspension_coil <- read.csv(file='C:/Users/ryanl/Documents/Good Class Folder/MechaCar_Statistical_Analysis/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
# stat summary as summarize()
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
# stat summary as group_by()
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep')

```

![Lot Summary Statistics.png](https://github.com/RyanJL18/MechaCar_Statistical_Analysis/blob/main/Resources/lot_summary_table.png)

![Total Summary Statistics.png](https://github.com/RyanJL18/MechaCar_Statistical_Analysis/blob/main/Resources/total_summary_table.png)

### Deliverable 3:
## T-Tests on Suspension Coils

Using your knowledge of R, perform t-tests to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.

```
# t-test for all the lots, mean of 1500 PSI
t.test(suspension_coil$PSI,mu=mean(suspension_coil$PSI))
# t-test for lot 1
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot1"),mu=mean(suspension_coil$PSI))
# t-test for lot 2
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot2"),mu=mean(suspension_coil$PSI))
# t-test for lot 3
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot3"),mu=mean(suspension_coil$PSI))
```

![T-Tests.png](https://github.com/RyanJL18/MechaCar_Statistical_Analysis/blob/main/Resources/t-tests.png)


### Deliverable 4:
## Study Design: MechaCar vs. Competition

Write a short description of a statistical study that can quantify how the MechaCar performs against the competition. In your study design, think critically about what metrics would be of interest to a consumer: for a few examples, cost, city or highway fuel efficiency, horse power, maintenance cost, or safety rating.

In your description, address the following questions:

What metric or metrics are you going to test?

What is the null hypothesis or alternative hypothesis?

What statistical test would you use to test the hypothesis? And why?

What data is needed to run the statistical test?
