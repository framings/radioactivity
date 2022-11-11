# Title     : EmergencyReadmission.R
# Objective : Reads and structures emergency readmission data of a set of hospitals
# Created by: greyhypotheses
# Created on: 11/11/2022


#' Emergency Readmission
#'
#' @note Emergency (within 30 days) readmission rates following discharge from 140 NHS
#'       acute trusts [in England], 2002–2003
#'
EmergencyReadmission <- function (){


  # The data
  emergency <- read.delim2(file = 'data/research/legacy/re.ad.discharge.txt', header = TRUE, sep = ',')
  emergency$cluster_code <- as.integer(x = substr(emergency$cluster, start = 1, stop = 1))


  # Save; foremost, ensure the storage directory exists
  pathstr <- file.path(getwd(), 'data', 'research', 'experimental')
  if (!dir.exists(paths = pathstr)){
    dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)
  }

  utils::write.table(x = emergency,
                     file = file.path(pathstr, 'england_acute_trusts_emergency_readmissions.csv'),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')


}