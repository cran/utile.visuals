% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/append.R
\name{append_table}
\alias{append_table}
\title{Append a ggplot2 table to the bottom of a ggplot2 plot}
\usage{
append_table(
  plot = NULL,
  table = NULL,
  plot.height = 1,
  table.height = 0.1,
  plot.width = 1,
  extract.legend = TRUE,
  legend.width = 0.2,
  legend.offset = -15
)
}
\arguments{
\item{plot}{Required. ggplot2::ggplot() object. If a legend is present, it will be
extracted.}

\item{table}{Required. ggplot2::ggplot object. If a legend is present, it will
be removed and ignored.}

\item{plot.height}{Optional. Numeric. Height of plot relative to table. Defaults
to 1.}

\item{table.height}{Optional. Numeric. Height of table relative to plot. Defaults
to 0.1.}

\item{plot.width}{Optional. Numeric. Width of plot relative to legend. Ignored
if no legend present in plot. Defaults to 1.}

\item{extract.legend}{Optional. Logical. Indicates whether to extract the legend
from the plot and reinsert it adjacent to the final combined plot. May be undesired
if legend already embedded within the plot area. Defaults to TRUE.}

\item{legend.width}{Optional. Numeric. Width of legend relative to plot. Ignored
if no legend present in plot or 'extract.legend'=FALSE. Defaults 0.2.}

\item{legend.offset}{Optional. Numeric. Vertical offset of legend. Used to raise
or lower. Ignored if no legend present in plot or 'extract.legend'=FALSE. Defaults
to -15.}
}
\value{
A ggplot2 tableGrob object. Use grid::grid.draw() to open in RStudio viewer.
Works with ggplot2::ggsave() out of the box.
}
\description{
Aligns axes and combines a ggplot2 plot and table into a single plot.
Can handle legends.
}
\note{
To ensure proper alignment, double check that both plots use the same scale
and breaks!
}
\examples{
library(survival)
library(ggplot2)
library(broom) # tidy() model data
library(grid) # grid.draw() finished plot

# Data with group names specified
data_diabetic <- diabetic
data_diabetic$trt <- as.factor(data_diabetic$trt)
levels(data_diabetic$trt) <- c('None', 'Laser')

# Survival Model
fit <- survfit(Surv(time, status) ~ trt, data = data_diabetic)

# Kaplan Meier (KM) Plot
plot_km <- ggplot(
 data = tidy(fit),
 mapping = aes(x = time, y = estimate)
) +
  geom_step(aes(color = strata)) +
  geom_stepconfint(aes(ymin = conf.low, ymax = conf.high, fill = strata), alpha = 0.3) +
  coord_cartesian(c(0, 50)) + # Note scale set here!
  scale_x_continuous(expand = c(0.02,0)) +
  labs(x = 'Time', y = 'Freedom From Event') +
  scale_color_manual(
    values = c('#d83641', '#1A45A7'),
    name = 'Treatment',
    labels = c('Laser', 'None'),
    aesthetics = c('colour', 'fill')) +
  theme_basic()

# Risk Table
tbl_risk <- ggrisktable(fit, c(0, 10, 20, 30, 40, 50)) +
  coord_cartesian(c(0, 50)) +
  scale_x_continuous(expand = c(0.02,0)) +
  theme_risk()

# Combine KM plot and risk table
plot_cmbd <- append_table(
  plot = plot_km,
  table = tbl_risk
)

# Draw in RStudio viewer
grid.newpage()
grid.draw(plot_cmbd)
}
