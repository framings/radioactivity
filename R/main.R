# Title     : main.R
# Objective : Playground
# Created by: greyhypotheses
# Created on: 11/11/2022


# Prepare the NY Coronary Artery Bypass Graft data
source(file = 'R/preliminary/SurgeonsNY.R')
SurgeonsNY()

# Prepare the NY Hospitals data
source(file = 'R/preliminary/HospitalsNY.R')
HospitalsNY()

# Prepare the England Acute Trusts' Emergency Readmission data
source(file = 'preliminary/EnglandEmergencyReadmission.R')
EnglandEmergencyReadmission()

# Prepare the England Acute Trusts' Bypass Surgeries data
source(file = 'R/preliminary/EnglandBypass.R')
EnglandBypass()

# Prepare the Teenage Pregnancies data
source(file = 'R/preliminary/TeenagePregnancies.R')
TeenagePregnancies()
