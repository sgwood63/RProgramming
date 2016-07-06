
readFrame <- function(directory, currentId) {
  # Generate the file name for the id
  if (currentId < 1 || currentId > 332) {
    print(paste("Invalid id:", currentId))
    return(NULL)
  } else if (currentId < 10) {
    currentIdString <- paste0(c("00", as.character(currentId)), collapse='')
  } else if (currentId < 100) {
    currentIdString <- paste0(c("0", as.character(currentId)), collapse='')
  } else {
    currentIdString <- as.character(currentId)
  }
  
  # create the full file name and path. check existence
  
  fileName <- paste0(c(directory, "/", currentIdString, ".csv"), collapse='')
  if (!file.exists(fileName)) {
    print(paste("File does not exist: ", fileName))
    return(NULL)
  }
  
  # load the file into a frame
  read.csv(fileName)
}

# Takes a directory of data files and a threshold for complete cases and
# calculates the correlation between sulfate and nitrate for monitor locations
# where the number of completely observed cases (on all variables) is greater
# than the threshold. The function should return a vector of correlations for 
# the monitors that meet the threshold requirement. If no monitors meet the 
# threshold requirement, then the function should return a numeric vector of length 0.

corr <- function(directory, threshold = 0) {

  result <- numeric()
  
  #for each location
  for (currentLocation in 1:332) {
    
    # get the valid readings list for sulfate and nitrate
    
    readings <- readFrame(directory, currentLocation)
    
    if (is.null(readings)) {
      next
    }
    
    validReadings <- subset(readings, IsDate(Date) & 
                              !is.na(nitrate) &
                              !is.na(sulfate) &
                              ID == currentLocation)
    
    if (nrow(validReadings) > threshold) {
      result[length(result) + 1] <- cor(validReadings$sulfate, validReadings$nitrate)
    }
  }
  result
}