# SoilNet
### Simple R code to import and clean up data from the Soil Network of sensors.
By: Stephen Teet

  Code originally written in R for cleaning up the data coming in from the pasture 13 (P13) Soil Network.  R code later (to be) added for the WRE Soil Network data.

  * SoilNetClean.R processes data from the standard P13 soil sensor stations.
  * SoilNetClean_2Stations.R processes data form the P13 soil sensor stations that have two sets of sensors attached, i.e. represent two stations.
  * SoilNetCleanWRE.R (will) process data from the WRE soil sensor stations.

## Directions for use:
In order to be able to use the R codes to process the SoilNet data, the following steps must be followed.
* Copy your downloaded .dat file and change the copy to a .csv.  You will get a warning about possibly losing file functionality, just ignore this.
* Open you new .csv file with Excel, and delete the excess header rows (1, 3, and 4) so that only the variable name is left.
* Save the file and exit Excel.
* Open the appropriate R code file in RStudio, making sure that your files are in the same directory.
* Edit the file name in the first line of code:
**        ```
        df1 <- read.csv('TOA5_75527.Cosmos_P13_Station21.csv')
        ```
* Also edit the file name in the write command near the end of the code:
**        ```
        write.csv(df3, "P13_Station21_31102023.csv", row.names = FALSE)
        ```
* Rune the code.
* The last line of code does a simple print out of the last days minimum battery voltage, check this value to make sure it is not too low, if so you may need to take a closer look at the battery health.
