
context("buildDictionary")

test_that("buildDictionary parses strings correctly",{
  expect_equal(buildDictionary("rawr ::= a | b | c", FALSE, formatKey=TRUE),
               data.frame(key="<rawr>",
                          val=c("a", "b", "c"),
                          stringsAsFactors=F))
  expect_equal(buildDictionary("rawr ::= a | b | c", FALSE, formatKey=FALSE),
               data.frame(key="rawr",
                          val=c("a", "b", "c"),
                          stringsAsFactors=F))
})

test_that("buildDictionary reads files correctly",{
  cat("rawr ::= 1 | 2",
      "boo ::= a | b",
      file="ex.data",
      sep="\n")
  expect_equal(buildDictionary("ex.data", TRUE),
               data.frame(key=c("<rawr>", "<rawr>", "<boo>", "<boo>"),
                          val=c("1", "2", "a", "b"),
                          stringsAsFactors=F))
  expect_equal(buildDictionary("ex.data", TRUE, formatKey=FALSE),
               data.frame(key=c("rawr", "rawr", "boo", "boo"),
                          val=c("1", "2", "a", "b"),
                          stringsAsFactors=F))
  unlink("ex.data")
})
