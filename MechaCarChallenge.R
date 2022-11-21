# DELIVERABLE 1:

# Import libraries
library(dplyr)
library(tidyverse)

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


