
context("Key Extractions")

test_that("extractKey handles inString properly",{
  expect_error(extractKey("",T))
  expect_error(extractKey(data.frame(x=1),T))
  expect_error(extractKey(list(x=1),T))
})

test_that("extractKey changes strings properly", {
  expect_equal(extractKey("start ::= value | value", TRUE), "<start>")
  expect_equal(extractKey("start ::= value | value", FALSE), "start")

})
