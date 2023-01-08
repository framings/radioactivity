# Title     : main.R
# Objective : Playground
# Created by: greyhypotheses
# Created on: 11/11/2022



#' Sources
#'
#'

# Prepare the NY Coronary Artery Bypass Graft data
source(file = 'R/sources/SurgeonsNY.R')
SurgeonsNY()

# Prepare the NY Hospitals data
source(file = 'R/sources/HospitalsNY.R')
HospitalsNY()

# Prepare the England Acute Trusts' Emergency Readmission data
source(file = 'R/sources/EnglandEmergencyReadmission.R')
EnglandEmergencyReadmission()

# Prepare the England Acute Trusts' Bypass Surgeries data
source(file = 'R/sources/EnglandBypass.R')
EnglandBypass()

# Prepare the Teenage Pregnancies data
source(file = 'R/sources/TeenagePregnancies.R')
TeenagePregnancies()



#' Metrics
#'
#'
source(file = 'R/metrics/SurvivalRate.R')
SurvivalRate()
