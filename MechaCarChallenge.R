# Import libraries
library(dplyr)
library(tidyverse)

# DELIVERABLE 1:

# Input Data
mecha_mpg <- read.csv(file='./Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

# Multi-linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

# Determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg))

# DELIVERABLE 2:

# Input Data
mecha_coil <- read.csv(file='./Data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

# Create a summary DF using the summarize() function to obtain the statistics of the coil's PSI column
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep')

# Create a summary DF using the group_by() and the summarize() functions to group each manufacturing lot
# by the statistics of the coil's PSI column:
lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')

# Deliverable 3

# T-test to determine if the PSI across all manufacturing lots is statistically
# different from the population mean of 1,500 pounds per square inch.
t.test(mecha_coil$PSI,mu=1500)

# Determine if the PSI for each manufacturing lot is statistically different
# from the population mean of 1,500 pounds per square inch
lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
t.test(lot1$PSI,mu=1500)

lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
t.test(lot2$PSI,mu=1500)

lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")
t.test(lot3$PSI,mu=1500)