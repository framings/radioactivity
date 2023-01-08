# Title     : TeenagePregnancies.R
# Objective : Teenage Pregnancies
# Created by: greyhypotheses
# Created on: 11/11/2022


#' Teenage Pregnancies
#'
#'
TeenagePregnancies <- function (){


  # The data
  pregnancies <- read.table(file = 'data/research/legacy/preg.data.txt', header = TRUE,  sep = '')
  pregnancies <- dplyr::rename(pregnancies, 'POP2001' = 'POP200')

  # Save; foremost, ensure the storage directory exists
  pathstr <- file.path(getwd(), 'data', 'research', 'experimental')
  if (!dir.exists(paths = pathstr)){
    dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)
  }

  utils::write.table(x = pregnancies,
                     file = file.path(pathstr, 'teenage_pregnancies.csv'),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

}
