# The `utile.visuals` package
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/utile.visuals)](https://CRAN.R-project.org/package=utile.visuals)
[![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/utile.visuals)](https://CRAN.R-project.org/package=utile.visuals)

## Overview
A small set of functions for making visuals for publication in ggplot2. Key functions include geom_stepconfint() for drawing a step confidence interval on a ggplot2 KM curve and theme_white()/theme_black() which are minimalist ggplot2 themes with transparent backgrounds.

## The `gg` Functions
- **ggrisktable()**: A simple wrapper function which calculates the numbers at risk for a survival model and a given set of time points then creates a ggplot2 table with them.

## The `geom_` Functions
- **geom_stepconfint()**: Produces a step function confidence interval for survival curves. Essentially the geom_step() for confidence intervals which ggplot2 elects not to provide.

## The `theme_` Functions:
- **theme_white()**: A ggplot2 theme which removes most background elements and makes all text/lines white.
- **theme_black()**: A ggplot2 theme which removes most background elements and makes all text/lines black.
- **theme_risk_white()**: Minimalist ggplot2 theme which removes most background elements and makes all text/lines white.
- **theme_risk_black()**: Minimalist ggplot2 theme which removes most background elements and makes all text/lines black.

## The `append_table` Functions
- **append_table()**: Aligns axes and combines a ggplot2 plot and table into a single plot. Can handle legends.
