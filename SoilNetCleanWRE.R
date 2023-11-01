# Code to import and clean data from the Soil Network
# By:  Stephen Teet 
# Import the data file (.csv)
df1 <- read.csv('TOA5_75527.Cosmos_P13_Station21.csv')

# *****Get daily averages using lubridate, tidyverse, and dplyr*****
# Import libraries
library(tidyverse)
library(lubridate)
library(dplyr, warn.conflicts = FALSE)

# Fix Date/Time format
df1$TIMESTAMP = mdy_hm(df1$TIMESTAMP, tz = "America/Chicago")

df2 <- data.frame(DateTime = df1$TIMESTAMP,
                  batt_volt = df1$batt_volt,
                  VWC1_Avg = df1$VWC1_Avg,
                  EC1_Avg = df1$EC1_Avg,
                  TSoil1_Avg = df1$TSoil1_Avg,
                  Perm1 = df1$Perm1,
                  PerAvg1 = df1$PerAvg1,
                  VoltR1 = df1$VoltR1,
                  VWC2_Avg = df1$VWC2_Avg,
                  EC2_Avg = df1$EC2_Avg,
                  TSoil2_Avg = df1$TSoil2_Avg,
                  Perm2 = df1$Perm2,
                  PerAvg2 = df1$PerAvg2,
                  VoltR2 = df1$VoltR2,
                  VWC3_Avg = df1$VWC3_Avg,
                  EC3_Avg = df1$EC3_Avg,
                  TSoil3_Avg = df1$TSoil3_Avg,
                  Perm3 = df1$Perm3,
                  PerAvg3 = df1$PerAvg3,
                  VoltR3 = df1$VoltR3,
                  VWC4_Avg = df1$VWC4_Avg,
                  EC4_Avg = df1$EC4_Avg,
                  TSoil4_Avg = df1$TSoil4_Avg,
                  Perm4 = df1$Perm4,
                  PerAvg4 = df1$PerAvg4,
                  VoltR4 = df1$VoltR4,
                  VWC5_Avg = df1$VWC5_Avg,
                  EC5_Avg = df1$EC5_Avg,
                  TSoil5_Avg = df1$TSoil5_Avg,
                  Perm5 = df1$Perm5,
                  PerAvg5 = df1$PerAvg5,
                  VoltR5 = df1$VoltR5)
# Get daily values
df3 <- df2 %>% group_by(DateTime = date(DateTime)) %>%
  summarise(batt_volt = min(batt_volt),
            VWC1_Avg = mean(VWC1_Avg),
            EC1_Avg = mean(EC1_Avg),
            TSoil1_Avg = mean(TSoil1_Avg),
            Perm1 = mean(Perm1),
            PerAvg1 = mean(PerAvg1),
            VoltR1 = mean(VoltR1),
            VWC2_Avg = mean(VWC2_Avg),
            EC2_Avg = mean(EC2_Avg),
            TSoil2_Avg = mean(TSoil2_Avg),
            Perm2 = mean(Perm2),
            PerAvg2 = mean(PerAvg2),
            VoltR2 = mean(VoltR2),
            VWC3_Avg = mean(VWC3_Avg),
            EC3_Avg = mean(EC3_Avg),
            TSoil3_Avg = mean(TSoil3_Avg),
            Perm3 = mean(Perm3),
            PerAvg3 = mean(PerAvg3),
            VoltR3 = mean(VoltR3),
            VWC4_Avg = mean(VWC4_Avg),
            EC4_Avg = mean(EC4_Avg),
            TSoil4_Avg = mean(TSoil4_Avg),
            Perm4 = mean(Perm4),
            PerAvg4 = mean(PerAvg4),
            VoltR4 = mean(VoltR4),
            VWC5_Avg = mean(VWC5_Avg),
            EC5_Avg = mean(EC5_Avg),
            TSoil5_Avg = mean(TSoil5_Avg),
            Perm5 = mean(Perm5),
            PerAvg5 = mean(PerAvg5),
            VoltR5 = mean(VoltR5))

# Write cleaned data table to .csv
write.csv(df3, "P13_Station21_31102023.csv", row.names = FALSE)

# Print last days minimum battery voltage
tail(df3$batt_volt, 1)
