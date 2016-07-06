
# Date validation
IsDate <- function(mydate, date.format = "%Y-%m-%d") {
  # Check if field is a date using as.Date that looks for unambiguous dates
  #   Assumes date format so NA returned not Character error. 
  #   Why? with no date format, R tries two defaults then gives error. 
  #   BUT With a dateformat R returns NA
  # Args
  #   Suspected date and optional date format string
  # Returns
  #   TRUE if thinbks it is a date
  tryCatch(!is.na(as.Date(mydate, date.format)),  
           error = function(err) {FALSE})  
}

# the number of completely observed cases in each data file

complete <- function(directory, id = 1:332) {
  # directory: name of directory containing readings files
  # id: id range of files. Files are named id.csv, with id zero filled to
  #     3 positions, ie. 001.csv, 020,csv, 134.csv
  # readings files are assumed to be csvs with columns:
  #     Date "YYYY-MM-DD"
  #     sulfate: empty (NA) or float
  #     nitrate: empty (NA) or float
  #     id: id of this sensor. 1-332 in test data set

  resultFrame <- NULL
  
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
    
    # count the valid readings in the file
    readings <- nrow(
          subset(frame, IsDate(Date) & 
                   !is.na(nitrate) &
                   !is.na(sulfate) &
                   ID == currentId))
    
    if (is.null(resultFrame)) {
      resultFrame <- data.frame(id = currentId, nobs = readings)
    } else {
      resultFrame <- rbind(resultFrame, c(currentId, readings)) 
    }
    
  }

  resultFrame
}