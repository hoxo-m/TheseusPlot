# TheseusPlot (development version)

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
