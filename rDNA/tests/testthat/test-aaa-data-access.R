context("Data access")
setup(
  unlink("sample.dna"),
  unlink(dir(pattern = "^dna-.+\\.jar$"))
)

test_that("download Jar", {
  expect_equal({
    file <- dna_downloadJar(path = ".", returnString = TRUE)
    file.exists(file)
  }, TRUE) 
})

# In case there have been recent changes in Java not yet online
unlink(dir(pattern = "../../dna-.+\\.jar$"))
system("cd ../../../ && make dna")
jar <- dir(path = "../../../output", pattern = "^dna-.+\\.jar$",
           full.names = TRUE)
file.copy(
  from = jar,
  to = basename(jar)
)

test_that("initialise DNA",{
  expect_equal({
    dna_init(basename(jar))
    rJava::.jarray(1:5)@jsig
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
