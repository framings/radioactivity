# Title     : EnglandBypass.R
# Objective : England Acute Trusts Bypass Surgeries
# Created by: greyhypotheses
# Created on: 09/12/2022


#' Bypass Surgeries
#'
#' @note England Acute Trusts Bypass Surgeries
#'
#'
EnglandBypass <- function () {


  # The data
  bypass <- read.delim2(file = 'data/research/legacy/bypass.txt', header = TRUE, sep = ',')
  bypass$cluster_code <- as.integer(x = substr(bypass$cluster, start = 1, stop = 1))


  # Save; foremost, ensure the storage directory exists
  pathstr <- file.path(getwd(), 'data', 'research', 'experimental')
  if (!dir.exists(paths = pathstr)){
    dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)
  }

  utils::write.table(x = bypass,
                     file = file.path(pathstr, 'england_acute_trusts_bypass.csv'),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')


}