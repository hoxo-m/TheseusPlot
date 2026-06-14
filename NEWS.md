# TheseusPlot 0.3.0

## User-visible changes

* Added an `xlab` argument to `create_ship()` for customizing the x-axis label
  used by `plot()` and `plot_flip()`.
* The automatic column-name subtitle was removed.
* Changed the default group labels from `"Original"` and `"Refitted"` to
  `"Baseline"` and `"Comparison"`.
* Changed the default number of displayed decimal places from 3 to 1.

## Plot improvements and bug fixes

* Fixed missing subgroup size bars in `plot()` and `plot_flip()` with 
  **waterfalls** 1.1.4.
* Improved subgroup size bar scaling so that bar heights are computed
  consistently from the maximum plot score in both `plot()` and `plot_flip()`.
* Fixed `text_size` handling in `plot()` and `plot_flip()` when applying the
  current ggplot2 theme.
  
# TheseusPlot 0.2.0

## Bug fixes

* Fixed a bug in continuous-variable discretization with `split = "rate"`
  where bin boundaries for the second group were incorrectly computed
  using the first group's data. (#6, thanks @statditto)
* Fixed a bug where the size bar for `"Sum of ... other attributes"` could
  incorrectly use the first group's counts for both groups. (#5, thanks
  @statditto)
* Fixed warnings in `plot()` and `plot_flip()` when multiple subgroups were
  tied for the largest absolute contribution.
* Suppressed spurious warnings generated internally by
  `waterfalls::waterfall()` during plot creation.

# TheseusPlot 0.1.1

* Initial CRAN submission.
