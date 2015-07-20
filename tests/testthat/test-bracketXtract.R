context("bracketXtract")

test_that("bracketXtract has base functionality", {
  expect_equal(bracketXtract("(hey there)", "("),
               list("hey there"))
  expect_equal(bracketXtract("(hey there)", "(", with=T),
               list("(hey there)"))
  expect_equal(bracketXtract("[hey there]", "["),
               list("hey there"))
  expect_equal(bracketXtract("[hey there]", "[", with=T),
               list("[hey there]"))
  expect_equal(bracketXtract("{hey there}", "{"),
               list("hey there"))
  expect_equal(bracketXtract("{hey there}", "{", with=T),
               list("{hey there}"))
  expect_equal(bracketXtract("(hey) {there}", "all"),
               list(c("hey", "there")))
  expect_equal(bracketXtract("(hey) {there}", "all", T),
               list(c("(hey)", "{there}")))
})
