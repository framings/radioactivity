# Title     : HospitalsNY.R
# Objective : Hospitals NY
# Created by: greyhypotheses
# Created on: 09/12/2022


#' NY: New York
#'
#' @description Reads and structures the New York State
#'              hospitals data
#'
HospitalsNY <- function () {


  # Probably a mortality ratio
  X <- read.delim2(file = 'data/research/legacy/NY-hospramr.txt', col.names = 'value', header = FALSE, sep = '')
  Y <- paste(X$value, collapse = ' ')
  Z <- unlist(strsplit(x = Y, split = ' '))


  # Probably the number of cases
  A <- read.delim2(file = 'data/research/legacy/NY-hospvol.txt', col.names = 'value', header = FALSE, sep = '')
  B <- paste(A$value, collapse = ' ')
  C <- unlist(strsplit(x = B, split = ' '))


  # Combining the data series
  hospitals <- data.frame(hospamr = Z, hospvol = C)
  hospitals$hospamr <- as.numeric(hospitals$hospamr)
  hospitals$hospvol <- as.numeric(hospitals$hospvol)


  # Save; foremost, ensure the storage directory exists
  pathstr <- file.path(getwd(), 'data', 'research', 'experimental')
  if (!dir.exists(paths = pathstr)){
    dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)
  }

  utils::write.table(x = hospitals,
                     file = file.path(pathstr, 'new_york_bypass_hospitals.csv'),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

}
