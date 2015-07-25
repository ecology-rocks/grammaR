context("generateCharacters")

test_that("generateCharacters produces a valid key value", {
  expect_equal(charmatch("rawr", generateCharacters("rawr", "M")), 1)
## make sure there are line breaks, which represent multiple entries
    expect_true(grepl("\n", generateCharacters(c("xy", "fem"), c("M", "F")), fixed=T))
})
