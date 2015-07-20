context("getAuthorTitles Check")

test_that("getAuthorTitles reads a file correctly", {
  expect_equal(getAuthorTitles("."),
               data.frame(title="Treacherous Blaze",
                          author="G. U. Cook",
                          stringsAsFactors=F))
})

test_that("getAuthorTitles rejects bad directories and files",{
  expect_error(getAuthorTitles(""))
  expect_error(getAuthorTitles("bad/"))
})
