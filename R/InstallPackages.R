# Title     : InstallPackages.R
# Objective : Install Packages
# Created by: greyhypotheses
# Created on: 11/11/2022


InstallPackages <- function (){

  packages <- c('tidyverse', 'data.table', 'ggplot2', 'gapminder', 'rmarkdown', 'alr4', 'GLMsData', 'rstatix',
                'latex2exp', 'faraway', 'healthcareai', 'equatiomatic', 'moments', 'mapview', 'tufte',
                'roxygen2', 'kableExtra', 'bookdown', 'paletteer', 'ggthemes', 'ggcorrplot', 'COUNT', 'AER',
                'lme4')

  # Install
  .install <- function(x){
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      if (x == 'rmarkdown') {tinytex::install_tinytex()}
    }
  }
  lapply(packages, .install)

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'healthcareai', 'equatiomatic', 'ggthemes', 'ggcorrplot'))], .activate)

  # Special Case
  if ('tidyverse' %in% packages) {
    lapply(X = c('magrittr', 'dplyr', 'tibble', 'ggplot2', 'stringr', 'lubridate'), .activate)
  }

  # Active libraries
  sessionInfo()

}