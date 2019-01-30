context("cleanup")

test_that("str_length is number of characters", {
  expect_that(nchar("a"), equals(1))
})

teardown({
  unlink("sample.dna")
  unlink(dir(pattern = "^dna-.+\\.jar$"))
})
