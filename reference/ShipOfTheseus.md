# An R6 Class for Generating Theseus Plot

The \`ShipOfTheseus\` class decomposes the difference in outcome rates
between two datasets and visualizes the results as a Theseus Plot. It
provides methods to compute contributions of individual attributes,
summarize results in tables, and generate waterfall-style plots for
intuitive interpretation.

## Methods

### Public methods

- [`ShipOfTheseus$new()`](#method-ShipOfTheseus-new)

- [`ShipOfTheseus$table()`](#method-ShipOfTheseus-table)

- [`ShipOfTheseus$plot()`](#method-ShipOfTheseus-plot)

- [`ShipOfTheseus$plot_flip()`](#method-ShipOfTheseus-plot_flip)

- [`ShipOfTheseus$clone()`](#method-ShipOfTheseus-clone)

------------------------------------------------------------------------

### Method `new()`

The constructor of the ShipOfTheseus class.

#### Usage

    ShipOfTheseus$new(data1, data2, outcome, labels, ylab, digits, text_size)

#### Arguments

- `data1`:

  data frame representing the first group (e.g., the baseline or
  "original" data).

- `data2`:

  data frame representing the second group (e.g., the comparison or
  "refitted" data).

- `outcome`:

  string specifying the outcome variable used to compute the rate metric
  (default is "y"). Typically, this is a binary indicator (e.g., 0/1)
  that is aggregated to form rates.

- `labels`:

  character vector of length 2 giving the labels for the two groups. The
  first corresponds to \`data1\`, the second to \`data2\`. Default is
  c("Original", "Refitted").

- `ylab`:

  string specifying the y-axis label for plots. If NULL (default), no
  label is displayed.

- `digits`:

  integer indicating the number of decimal places to use for displaying
  numeric values (default is 3).

- `text_size`:

  numeric value specifying the relative size of text elements in plots
  (default is 1).

#### Returns

A ShipOfTheseus object, which can be used with
[`plot()`](https://rdrr.io/r/graphics/plot.default.html) to create
Theseus plots.

------------------------------------------------------------------------

### Method [`table()`](https://rdrr.io/r/base/table.html)

Generate a contribution table for a given column.

#### Usage

    ShipOfTheseus$table(column_name, n = Inf, continuous = continuous_config())

#### Arguments

- `column_name`:

  string. The name of the column to analyze.

- `n`:

  integer. Maximum number of top contributing attributes to display. If
  the number of attributes exceeds \`n\`, the remaining are aggregated.

- `continuous`:

  list. A configuration list for handling continuous variables (e.g.,
  specifying number of bins or custom breaks).

#### Returns

A tibble summarizing each attribute's contribution to the difference
between the two groups, including counts, total outcomes, and rates for
each subgroup.

------------------------------------------------------------------------

### Method [`plot()`](https://rdrr.io/r/graphics/plot.default.html)

Generate a Theseus plot for a specified column

#### Usage

    ShipOfTheseus$plot(
      column_name,
      n = 10L,
      main_item = NULL,
      bar_max_value = NULL,
      levels = NULL,
      continuous = continuous_config()
    )

#### Arguments

- `column_name`:

  The name of the column to visualize.

- `n`:

  integer. Maximum number of top contributing attributes to display.
  Remaining attributes are aggregated if necessary.

- `main_item`:

  string. The attribute used as the reference for scaling the bar
  heights.

- `bar_max_value`:

  numeric. Maximum value for scaling the contribution bars.

- `levels`:

  character vector specifying the display order of attributes.

- `continuous`:

  list. Configuration for handling continuous variables (e.g., number of
  bins or custom breaks).

#### Returns

A ggplot object representing the Theseus Plot for the specified column.

------------------------------------------------------------------------

### Method `plot_flip()`

Generate a Theseus plot for a specified column

#### Usage

    ShipOfTheseus$plot_flip(
      column_name,
      n = 10L,
      main_item = NULL,
      bar_max_value = NULL,
      levels = NULL,
      continuous = continuous_config()
    )

#### Arguments

- `column_name`:

  The name of the column to visualize.

- `n`:

  integer. Maximum number of top contributing attributes to display.
  Remaining attributes are aggregated if necessary.

- `main_item`:

  string. The attribute used as the reference for scaling the bar
  heights.

- `bar_max_value`:

  numeric. Maximum value for scaling the contribution bars.

- `levels`:

  character vector specifying the display order of attributes.

- `continuous`:

  list. Configuration for handling continuous variables (e.g., number of
  bins or custom breaks).

#### Returns

A ggplot object representing the Theseus Plot for the specified column.

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    ShipOfTheseus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
