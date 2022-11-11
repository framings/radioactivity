# Title     : NY.R
# Objective : Structuring the New York State Coronary Artery Bypass Graft (CABG) data
# Created by: greyhypotheses
# Created on: 11/11/2022


#' NY: New York
#'
#' @description Reads and structures the New York State Coronary Artery
#'              Bypass Graft (CABG) data
#'
NY <- function () {

  X <- read.delim2(file = 'data/research/legacy/NY-surgramr.txt', col.names = 'value', header = FALSE, sep = '\n')
  Y <- paste(X$value, collapse = ' ')
  Z <- unlist(strsplit(x = Y, split = ' '))

  A <- read.delim2(file = 'data/research/legacy/NY-surgvol.txt', col.names = 'value', header = FALSE, sep = '\n')
  B <- paste(A$value, collapse = ' ')
  C <- unlist(strsplit(x = B, split = ' '))

  surgeons <- data.frame(surgamr = Z[!(Z %in% '')], surgvol = C[!(C %in% '')])

}
