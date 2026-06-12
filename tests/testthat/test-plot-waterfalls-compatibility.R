make_plot_test_ship <- function() {
  data1 <- data.frame(
    group = rep(c("A", "B"), each = 4L),
    y = c(1, 1, 1, 0, 1, 0, 0, 0)
  )
  data2 <- data.frame(
    group = rep(c("A", "B"), each = 4L),
    y = c(1, 0, 0, 0, 0, 0, 0, 0)
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

test_that("plot() retains subgroup size bars with waterfalls 1.1.4", {
  ship <- make_plot_test_ship()

  size_bar_data <- ship$plot(group) |> get_size_bar_data()

  expect_valid_size_bars(size_bar_data)
})

test_that("plot_flip() retains subgroup size bars with waterfalls 1.1.4", {
  ship <- make_plot_test_ship()

  size_bar_data <- ship$plot_flip(group) |> get_size_bar_data()

  expect_valid_size_bars(size_bar_data, is_flip = TRUE)
})
