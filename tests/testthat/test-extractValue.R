
context("Value Extractions")

test_that("extractKey handles inString properly",{
  expect_error(extractValue("",T))
  expect_error(extractValue(data.frame(x=1),T))
  expect_error(extractValue(list(x=1),T))
})

test_that("extractValue changes strings properly", {
  expect_equal(extractValue("start ::= value | value", TRUE), c("value", "value"))
  expect_equal(extractValue("start ::= value | value", FALSE), "value | value")

})
