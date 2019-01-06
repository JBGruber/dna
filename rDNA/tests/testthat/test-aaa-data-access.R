context("Data access")
setup(
  if (file.exists("sample.dna") | file.exists(formals(dna_downloadJar)$filename)) {
    unlink("sample.dna")
    unlink(formals(dna_downloadJar)$filename)
  }
)

test_that("download Jar", {
  expect_equal({
    dna_downloadJar()
    file.exists(formals(dna_downloadJar)$filename)
  }, TRUE) 
})

test_that("initialise DNA",{
  expect_equal({
    dna_init()
    .jarray(1:5)@jsig
  }, "[I")
})

test_that("load sample", {
  expect_equal({
    file.size(dna_sample())
  }, file.size(system.file("extdata", "sample.dna", package = "rDNA")))
})

test_that("connect to db", {
  expect_equal(
    dna_connection(dna_sample(overwrite = TRUE, verbose = FALSE))$dna_connection@jclass,
    "dna/export/ExporterR"
  )
})
