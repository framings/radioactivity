# Title     : main.R
# Objective : Playground
# Created by: greyhypotheses
# Created on: 11/11/2022


# Prepare the NY Coronary Artery Bypass Graft data
source(file = 'R/preliminary/SurgeonsNY.R')
SurgeonsNY()

source(file = 'R/preliminary/HospitalsNY.R')
HospitalsNY()

# Prepare the England Acute Trusts' Emergency Readmission data
source(file = 'R/preliminary/EmergencyReadmission.R')
EmergencyReadmission()

