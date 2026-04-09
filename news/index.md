# Changelog

## TheseusPlot 0.2.0

### Bug fixes

- Fixed a bug in continuous-variable discretization with
  `split = "rate"` where bin boundaries for the second group were
  incorrectly computed using the first group’s data.
  ([\#6](https://github.com/hoxo-m/TheseusPlot/issues/6), thanks 1)
- Fixed a bug where the size bar for `"Sum of ... other attributes"`
  could incorrectly use the first group’s counts for both groups.
  ([\#5](https://github.com/hoxo-m/TheseusPlot/issues/5), thanks
  1.  
- Fixed warnings in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) and
  `plot_flip()` when multiple subgroups were tied for the largest
  absolute contribution.
- Suppressed spurious warnings generated internally by
  [`waterfalls::waterfall()`](https://rdrr.io/pkg/waterfalls/man/waterfall.html)
  during plot creation.

## TheseusPlot 0.1.1

CRAN release: 2025-08-28

- Initial CRAN submission.
