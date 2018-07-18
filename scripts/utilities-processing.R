library(dplyr)
library(datapkg)
library(tidyr)

##################################################################
#
# Processing Script for Utilities
# Created by Jenna Daly
# On 06/01/2017
#
##################################################################

#Setup environment
sub_folders <- list.files()
raw_location <- grep("raw$", sub_folders, value=T)
data_location <- grep("data$", sub_folders, value=T)
path_to_raw <- (paste0(getwd(), "/", raw_location))
path_to_data <- (paste0(getwd(), "/", data_location))
util <- dir(path_to_raw, recursive=T, pattern = "util")

utilities <- read.csv(paste0(path_to_raw, "/", util[2]), stringsAsFactors = F, header=T, check.names=F)
utilities18 <- read.csv(paste0(path_to_raw, "/", util[1]), stringsAsFactors = F, header=T, check.names=F)

#bind together previous years and new data
utilities <- rbind(utilities, utilities18)

#arrange by Town
utilities <- utilities %>% arrange(Town)

#Write to file
write.table(
  utilities,
  file.path(getwd(), "data", "utilities.csv"),
  sep = ",",
  row.names = F
)