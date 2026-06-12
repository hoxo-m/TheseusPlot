make_plot_test_ship <- function(labels = c("Before", "After")) {
  data1 <- data.frame(
    group = rep(c("A", "B"), each = 4L),
    y = c(1, 1, 1, 0, 1, 0, 0, 0)
  )
  data2 <- data.frame(
    group = rep(c("A", "B"), each = 4L),
    y = c(1, 0, 0, 0, 0, 0, 0, 0)
  )

  create_ship(data1, data2, y = y, labels = labels)
}

make_many_item_plot_test_ship <- function() {
  items <- paste0("item", seq_len(9L))
  data1 <- data.frame(
    group = rep(items, times = seq_along(items)),
    y = rep(c(0, 1), length.out = sum(seq_along(items)))
  )
  data2 <- data.frame(
    group = rep(items, times = rev(seq_along(items))),
    y = rep(c(1, 0), length.out = sum(seq_along(items)))
  )

  create_ship(data1, data2, y = y, labels = c("Before", "After"))
}

get_size_bar_data <- function(plot) {
  is_col_layer <- vapply(
    plot$layers,
    \(layer) inherits(layer$geom, "GeomCol"),
    logical(1)
  )

  expect_equal(sum(is_col_layer), 1L)
  plot$layers[[which(is_col_layer)]]$data
}

expect_valid_size_bars <- function(size_bar_data, is_flip = FALSE) {
  actual <- size_bar_data |> select(-items)
  
  last_item <- "After"
  if (is_flip) last_item <- "Before"
  levels <- c("Before", "After")
  if (is_flip) levels <- rev(levels)

  expected <- tibble(
    x = c("1", "2", "2", "3", "3", last_item),
    n = c(0, 25, 25, 25, 25, 0),
    type =  factor(c(NA, "Before", "After", "Before", "After", NA), levels = levels)
  )

  expect_equal(actual, expected)
}

expect_size_bars_in_item_order <- function(size_bar_data, is_flip = FALSE) {
  items <- paste0("item", seq_len(9L))
  n_items <- length(items)
  first_label <- "Before"
  last_label <- "After"
  before_size <- seq_len(9L) * 10
  after_size <- rev(seq_len(9L)) * 10

  if (is_flip) {
    items <- rev(items)
    first_label <- "After"
    last_label <- "Before"
    before_size <- rev(before_size)
    after_size <- rev(after_size)
  }

  actual <- size_bar_data |>
    mutate(x = as.character(x)) |>
    select(x, items, n, type)

  expected <- tibble(
    x = c(
      "1",
      rep(as.character(seq_along(items) + 1L), each = 2L),
      as.character(n_items + 2L)
    ),
    items = c(first_label, rep(items, each = 2L), last_label),
    n = c(0, as.vector(rbind(before_size, after_size)), 0),
    type = factor(
      c(NA, rep(c("Before", "After"), times = n_items), NA),
      levels = if (is_flip) c("After", "Before") else c("Before", "After")
    )
  )

  expect_equal(actual, expected)
}

test_that("plot() retains axis labels with waterfalls 1.1.4", {
  ship <- make_plot_test_ship()

  plot <- ship$plot(group)
  panel <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]

  expect_equal(panel$x$get_labels(), c("Before", "A", "B", "After"))
})

test_that("plot_flip() retains axis labels with waterfalls 1.1.4", {
  ship <- make_plot_test_ship()

  plot <- ship$plot_flip(group)
  panel <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]

  expect_equal(panel$y$get_labels(), c("After", "B", "A", "Before"))
})

test_that("plot() supports numeric group labels", {
  ship <- make_plot_test_ship(labels = c(1, 2))

  plot <- ship$plot(group)
  panel <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]

  expect_equal(panel$x$get_labels(), c("1", "A", "B", "2"))
})

test_that("plot_flip() supports numeric group labels", {
  ship <- make_plot_test_ship(labels = c(1, 2))

  plot <- ship$plot_flip(group)
  panel <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]

  expect_equal(panel$y$get_labels(), c("2", "B", "A", "1"))
})

test_that("plot() keeps size bars ordered with nine subgroups", {
  ship <- make_many_item_plot_test_ship()
  items <- paste0("item", seq_len(9L))

  size_bar_data <- ship$plot(
    group,
    levels = items,
    bar_max_value = 90
  ) |>
    get_size_bar_data()

  expect_size_bars_in_item_order(size_bar_data)
})

test_that("plot_flip() keeps size bars ordered with nine subgroups", {
  ship <- make_many_item_plot_test_ship()
  items <- paste0("item", seq_len(9L))

  size_bar_data <- ship$plot_flip(
    group,
    levels = items,
    bar_max_value = 90
  ) |>
    get_size_bar_data()

  expect_size_bars_in_item_order(size_bar_data, is_flip = TRUE)
})
