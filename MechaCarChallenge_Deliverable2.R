# Import libraries
library(dplyr)
library(tidyverse)

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


