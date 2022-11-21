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