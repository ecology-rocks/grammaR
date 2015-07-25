context("xDictionaryEntry functions")

testdic <- data.frame(key=c("<tigers>", "<tigers>",
                            "<lions>", "<lions>"),
                      val=c("a", "b",
                            "c", "d"),
                      stringsAsFactors=F)

test_that("removeDictionaryEntry removes keys", {
  expect_equal(removeDictionaryEntry(testdic, key="lions"), testdic[-c(3,4),])
})
test_that("removeDictionaryEntry removes values", {
  expect_equal(removeDictionaryEntry(testdic, val="d"), testdic[-4,])
})

test_that("echoDictionaryEntry echoes correctly", {
  expect_equal(echoDictionaryEntry(testdic, key="lions"), c("c", "d"))
  expect_equal(echoDictionaryEntry(testdic, val="a"), "<tigers>")
})
