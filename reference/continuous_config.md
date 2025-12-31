# Continuous Variable Configuration for Theseus Plot

The `continuous_config()` function creates a configuration object for
handling continuous variables in Theseus plots. It controls how
continuous data is binned into discrete categories for contribution
calculations and visualization.

## Usage

``` r
continuous_config(
  n = 10L,
  pretty = TRUE,
  split = c("count", "width", "rate"),
  breaks = NULL
)
```

## Arguments

- n:

  integer. Number of bins to create for a continuous variable.

- pretty:

  logical. If TRUE, use pretty breaks for bin edges.

- split:

  string. Method for binning continuous variables. Options are:

  `"count"`

  :   divide the variable into bins with roughly equal number of
      observations.

  `"width"`

  :   divide the range of the variable into equal-width bins.

  `"rate"`

  :   divide based on differences in outcome rates between bins.

- breaks:

  numeric vector specifying custom break points.

## Value

A list containing binning parameters (`n`, `pretty`, `split`, `breaks`)
to be used in plotting or contribution calculations for continuous
variables.

## Examples

``` r
library(TheseusPlot)
continuous_config(n = 5, pretty = FALSE, split = "rate")
#> $n
#> [1] 5
#> 
#> $pretty
#> [1] FALSE
#> 
#> $split
#> [1] "rate"
#> 
#> $breaks
#> NULL
#> 
```
