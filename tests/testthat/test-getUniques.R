context("getUniques")

sampleDf <- data.frame(key=c("<rubber>", "<joy>", "<hangar>"),
                   val=c("farm", "farm", "toys"),
                   stringsAsFactors=F)
dirtyDf <- data.frame(key=c("<rubber>", "<joy>", "<hangar>"),
                       val=c("farm", "farm", "toys|"),
                       stringsAsFactors=F)
cleanDf <- data.frame(key="<hangar>", val="toys", stringsAsFactors=F)

test_that("getUniques removes duplicates", {
  expect_equal(getUniques(sampleDf), cleanDf)
})

test_that("getUniques cleans out unwanted symbols", {
  expect_equal(getUniques(dirtyDf), cleanDf)
})

colnames(sampleDf) <- c("1", "2")

test_that("getUniques checks inputs", {
  expect_error(getUniques())
  expect_error(getUniques("rawr"))
  expect_error(getUniques(sampleDf))
})

rm(list=c("sampleDf", "dirtyDf", "cleanDf"))
