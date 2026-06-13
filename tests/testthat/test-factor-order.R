test_that("table() respects factor level order", {
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
  
  ship <- create_ship(data1, data2, y = y)
  tbl <- ship$table(segment)
  
  expect_s3_class(tbl$segment, "factor")
  expect_identical(as.character(tbl$segment), segment_order)
  expect_equal(levels(tbl$segment), segment_order)
})
