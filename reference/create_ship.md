# Creates a Ship Object for Generating Theseus Plots

Creates a ship object, which serves as a container for data and methods
to generate Theseus plots for decomposing differences in rate metrics.

## Usage

``` r
create_ship(
  data1,
  data2,
  y = "y",
  labels = c("Original", "Refitted"),
  ylab = NULL,
  digits = 3L,
  text_size = 1
)
```

## Arguments

- data1:

  data frame representing the first group (e.g., the baseline or
  "original" data).

- data2:

  data frame representing the second group (e.g., the comparison or
  "refitted" data).

- y:

  column name specifying the outcome variable used to compute the rate
  metric (default is `"y"`). Typically, this is a binary indicator
  (e.g., 0/1) that is aggregated to form rates.

- labels:

  character vector of length 2 giving the labels for the two groups. The
  first corresponds to `data1`, the second to `data2`. Default is
  `c("Original", "Refitted")`.

- ylab:

  string specifying the y-axis label for plots. If `NULL` (default), no
  label is displayed.

- digits:

  integer indicating the number of decimal places to use for displaying
  numeric values (default is 3).

- text_size:

  numeric value specifying the relative size of text elements in plots
  (default is 1.0).

## Value

A
[ShipOfTheseus](https://hoxo-m.github.io/TheseusPlot/reference/ShipOfTheseus.md)
object, which can be used with
[`plot()`](https://rdrr.io/r/graphics/plot.default.html) to create
Theseus plots.

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
library(TheseusPlot)

data <- nycflights13::flights |>
  filter(!is.na(arr_delay)) |>
  mutate(on_time = arr_delay <= 0)

data1 <- data |> filter(month == 1)
data2 <- data |> filter(month == 2)

create_ship(data1, data2, y = on_time)
#> <ShipOfTheseus>
#>   Public:
#>     clone: function (deep = FALSE) 
#>     initialize: function (data1, data2, outcome, labels, ylab, digits, text_size) 
#>     plot: function (column_name, n = 10L, main_item = NULL, bar_max_value = NULL, 
#>     plot_flip: function (column_name, n = 10L, main_item = NULL, bar_max_value = NULL, 
#>     table: function (column_name, n = Inf, continuous = continuous_config()) 
#>   Private:
#>     compute_contribution: function (column_name, continuous) 
#>     compute_info: function (column_name, continuous) 
#>     compute_scores: function (column_name) 
#>     compute_size: function (column_name, target, continuous) 
#>     digits: 3
#>     labels: Original Refitted
#>     text_size: 1
#>     to_factor: function (column_name, continuous) 
#>     ylab: NULL
```
