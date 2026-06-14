make_factor_order_ship <- function() {
  segment_order <- c("Low", "Medium", "High")
  
  data1 <- data.frame(
    segment = factor(
      c("Low", "Low", "Medium", "Medium", "High", "High"),
      levels = segment_order
    ),
    y = c(1, 1, 1, 0, 1, 1)
  )
  
  data2 <- data.frame(
    segment = factor(
      c("Low", "Low", "Medium", "Medium", "High", "High"),
      levels = segment_order
    ),
    y = c(1, 0, 1, 1, 0, 0)
  )
  
  create_ship(data1, data2, y = y)
}

get_factor_order_size_bar_items <- function(plot) {
  is_col_layer <- vapply(
    plot$layers,
    \(layer) inherits(layer$geom, "GeomCol"),
    logical(1)
  )

  as.character(plot$layers[[which(is_col_layer)]]$data$items)
}

test_that("table() respects factor level order", {
  segment_order <- c("Low", "Medium", "High")
  ship <- make_factor_order_ship()
  tbl <- ship$table(segment)
  
  expect_s3_class(tbl$segment, "factor")
  expect_identical(as.character(tbl$segment), segment_order)
  expect_equal(levels(tbl$segment), segment_order)
})

test_that("plots respect factor level order", {
  plot <- make_factor_order_ship()$plot(segment)
  panel <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]

  expect_equal(
    panel$x$get_labels(),
    c("Original", "Low", "Medium", "High", "Refitted")
  )
  expect_equal(
    get_factor_order_size_bar_items(plot),
    c("Original", rep(c("Low", "Medium", "High"), each = 2L), "Refitted")
  )
})

test_that("flipped plots reverse factor level order", {
  plot <- make_factor_order_ship()$plot_flip(segment)
  panel <- ggplot2::ggplot_build(plot)$layout$panel_params[[1]]

  expect_equal(
    panel$y$get_labels(),
    c("Refitted", "High", "Medium", "Low", "Original")
  )
  expect_equal(
    get_factor_order_size_bar_items(plot),
    c("Refitted", rep(c("High", "Medium", "Low"), each = 2L), "Original")
  )
})
