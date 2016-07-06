
# The mean of a pollutant (sulfate or nitrate) across a specified list of monitors

pollutantmean <- function(directory, pollutant, id = 1:332) {
  # directory: name of directory containing readings files
  # pollutant: nitrate or sulfate
  # id: id range of files. Files are named id.csv, with id zero filled to
  #     3 positions, ie. 001.csv, 020,csv, 134.csv
  # readings files are assumed to be csvs with columns:
  #     Date "YYYY-MM-DD"
  #     sulfate: empty (NA) or float
  #     nitrate: empty (NA) or float
  #     id: id of this sensor. 1-332 in test data set
  
  currentSum <- 0; currentCount <- 0
  
  # loop through the ids
  
  for (currentId in id) {
    
    # Generate the file name for the id
    if (currentId < 1 || currentId > 332) {
      print(paste("Invalid id:", currentId))
      break
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
      break
    }
    
    # load the file into a frame
    frame <- read.csv(fileName)
    
    # get the valid readings for the pollutant
    readings <- frame[[pollutant]][!is.na(frame[[pollutant]])]
    
    # keep running sum of readings and count for final calculation
    currentSum <- currentSum + sum(readings)
    currentCount <- currentCount + length(readings)
  }
  
  # the mean is the sum(all pollutant readings) / count of readings
  
  currentSum / currentCount
}