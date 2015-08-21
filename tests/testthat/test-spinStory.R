context("spinStory")

cat("The dog? walked! in the park.", "The End.", sep="\n", file="sampleStory.txt")
myDic <- data.frame(key=c("<animal>", "<animal>", "<walk>", "<walk>", "<park>"),
                    val=c("dog", "in", "ran", "walked", "park"), stringsAsFactors=F)
expResponse <- "The <animal>? <walk>! <animal> the <park>."
spinStory("sampleStory.txt", myDic, "rawr.txt" )

## check all functions in one.
test_that("spinStory finds words correctly", {
  expect_equal(spinStory("sampleStory.txt", myDic, "rawr.txt" )[[1]], expResponse)
})

## check for types
test_that("spinStory throws errors with weird inputs", {
  expect_error(spinStory(1), "Sorry, filenames")
  expect_error(spinStory("sampleStory.txt", myDic, 1), "Sorry, filenames")
  expect_error(spinStory("sampleStory.txt", 1, "rawr.txt"), "Sorry, mydic")
})

unlink("sampleStory.txt")
unlink("rawr.txt")
