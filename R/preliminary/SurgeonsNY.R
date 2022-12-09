# Title     : NY.R
# Objective : Structuring the New York State Coronary Artery Bypass Graft (CABG) data
# Created by: greyhypotheses
# Created on: 11/11/2022


#' NY: New York
#'
#' @description Reads and structures the New York State Coronary Artery
#'              Bypass Graft (CABG) data
#'
NY <- function() {


  # Probably a mortality ratio
  X <- read.delim2(file = 'data/research/legacy/NY-surgramr.txt', col.names = 'value', header = FALSE, sep = '\n')
  Y <- paste(X$value, collapse = ' ')
  Z <- unlist(strsplit(x = Y, split = ' '))


  # Probably the number of cases
  A <- read.delim2(file = 'data/research/legacy/NY-surgvol.txt', col.names = 'value', header = FALSE, sep = '\n')
  B <- paste(A$value, collapse = ' ')
  C <- unlist(strsplit(x = B, split = ' '))


  # Combining the data series
  surgeons <- data.frame(surgamr = Z[!(Z %in% '')], surgvol = C[!(C %in% '')])
  surgeons$surgamr <- as.numeric(surgeons$surgamr)
  surgeons$surgvol <- as.numeric(surgeons$surgvol)


  # Save; foremost, ensure the storage directory exists
  pathstr <- file.path(getwd(), 'data', 'research', 'experimental')
  if (!dir.exists(paths = pathstr)){
    dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)
  }

  utils::write.table(x = surgeons,
                     file = file.path(pathstr, 'new_york_bypass_surgeons.csv'),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

}
