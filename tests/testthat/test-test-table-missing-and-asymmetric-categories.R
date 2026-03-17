test_that("table() handles missing and asymmetric categories correctly", {
  data1 <- data.frame(
    group = c("A", "A", "B", NA),
    y = c(1, 1, 0, 1),
    stringsAsFactors = FALSE
  )
  
  data2 <- data.frame(
    group = c("A", "C", "C", NA),
    y = c(0, 1, 0, 0),
    stringsAsFactors = FALSE
  )
  
  ship <- create_ship(data1, data2, y = y)
  tbl <- ship$table(group, n = Inf)
  
  # Missing values and one-sided categories are retained
  expect_setequal(tbl$group, c("A", "B", "C", "(Missing)"))
  
  # Absent categories are zero-filled
  expect_equal(tbl$n1[tbl$group == "C"], 0L)
  expect_equal(tbl$x1[tbl$group == "C"], 0L)
  expect_equal(tbl$n2[tbl$group == "B"], 0L)
  expect_equal(tbl$x2[tbl$group == "B"], 0L)
  
  # Contributions add up to the overall difference
  overall_diff <- mean(data2$y) - mean(data1$y)
  expect_equal(sum(tbl$contrib), overall_diff, tolerance = 1e-12)
  
  # Table totals match the input data
  expect_equal(sum(tbl$n1), nrow(data1))
  expect_equal(sum(tbl$n2), nrow(data2))
})
