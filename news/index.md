# Changelog

## TheseusPlot 0.3.0

### User-visible changes

- Added an `xlab` argument to
  [`create_ship()`](https://hoxo-m.github.io/TheseusPlot/reference/create_ship.md)
  for customizing the x-axis label used by
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) and
  `plot_flip()`.
- The automatic column-name subtitle was removed.
- Changed the default group labels from `"Original"` and `"Refitted"` to
  `"Baseline"` and `"Comparison"`.
- Changed the default number of displayed decimal places from 3 to 1.

### Plot improvements and bug fixes

- Fixed missing subgroup size bars in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) and
  `plot_flip()` with **waterfalls** 1.1.4.
- Improved subgroup size bar scaling so that bar heights are computed
  consistently from the maximum plot score in both
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) and
  `plot_flip()`.
- Fixed `text_size` handling in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) and
  `plot_flip()` when applying the current ggplot2 theme.

## TheseusPlot 0.2.0

CRAN release: 2026-04-09

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
