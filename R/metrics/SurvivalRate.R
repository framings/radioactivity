# Title     : SurvivalRate.R
# Objective : Survival Rate
# Created by: greyhypotheses
# Created on: 07/11/2022


SurvivalRate <- function () {

  # the data
  dataset <- read.csv(file = 'data/hub/survival.csv')
  dataset$deviation <- 1/dataset$precision


  # ascertain order
  dataset <- dataset %>%
    dplyr::arrange(precision)


  # the limits
  dataset$inner_lower <- -2 * dataset$deviation
  dataset$inner_upper <- 2 * dataset$deviation
  dataset$outer_lower <- -3 * dataset$deviation
  dataset$outer_upper <- 3 * dataset$deviation


  # structuring
  frame <- dataset %>%
    gather(key = 'measure', value = 'estimate', -c(site, precision, deviation))


  # grouping
  groupings <- data.frame(measure = c('survival', 'target', 'inner_lower', 'inner_upper',  'outer_lower', 'outer_upper'),
                          parent = c('Survival', 'Target', '2 Std. Dev.','2 Std. Dev.', '3 Std. Dev.', '3 Std. Dev.'))
  frame <- dplyr::left_join(frame, groupings, by = 'measure')


  # a preview
  diagram <- ggplot(data = frame, mapping = aes(x = precision, y = estimate, group = measure, colour = parent)) +
    scale_colour_manual(values = c('olivedrab', 'orange', 'black', 'dodgerblue')) +
    geom_point(alpha = 0.65, size = 0.2) +
    geom_hline(yintercept = 0, colour = 'black', alpha = 0.35) +
    theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major = element_line(size = 0.05, colour = '#fafafa'),
          axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10),
          axis.title.x = element_text(size = 12), axis.title.y = element_text(size = 12),
          legend.title = element_text(size = 10), legend.text = element_text(size = 9)) +
    xlab(label = '\nprecision\n') +
    ylab(label = '\nexcess rate of\nsurvival\n') +
    guides(colour = guide_legend(title = 'Survival Estimates & Standard\nDeviation Control Limits'))
  print(diagram)


  # write
  pathstr <- file.path(getwd(), 'warehouse', 'miscellaneous')
  if (!dir.exists(paths = pathstr)){
    dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)
  }

  utils::write.table(x = frame,
                     file = file.path(pathstr, 'life.csv'),
                     append = FALSE,
                     sep = ',',
                     row.names = FALSE,
                     col.names = TRUE,
                     fileEncoding = 'UTF-8')

  base::write(jsonlite::toJSON(frame), file = file.path(pathstr, 'life.json'))

}


