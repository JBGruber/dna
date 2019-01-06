context("Data management")

dna_init()
conn <- dna_connection("sample.dna")

# Not working
# test_that("add Attribute", {
#   expect_equal({
#     dna_addAttribute(conn)
#   }, TRUE) 
# })

test_that("add Document",{
  expect_output({
    dna_addDocument(conn, date = as.POSIXct("2018-12-02 19:32:19 GMT", tz = "GMT"))
  }, "A new document with ID 8 was added to the database.")
})

test_that("get Attributes", {
  expect_equal({
    dna_getAttributes(conn)
  }, readRDS("../files/dna_getAttributes.RDS"))
})

#saveRDS(dna_getAttributes(conn), "../files/dna_getAttributes.RDS")

test_that("get Documents", {
  expect_equal({
    dna_getDocuments(conn)
  }, readRDS("../files/dna_getDocuments.RDS"))
})

#saveRDS(dna_getDocuments(conn), "../files/dna_getDocuments.RDS")

# Not working
# test_that("remove Attribute", {
#   expect_equal({
#     dna_removeAttribute(conn, attribute = 1)
#   }, readRDS("../files/dna_getDocuments.RDS"))
# })

#saveRDS(dna_getDocuments(conn), "../files/dna_getDocuments.RDS")

# output produced by Java can't be captured
# test_that("remove Document",{
#   expect_output({
#     dna_removeDocument(conn, id = 8)
#   }, "Simulation mode: no actual changes are made to the database!\nStatements removed in Document 8: 0")
# })

# Not working
# test_that("set Attributes", {
#   expect_equal({
#     att <- dna_getAttributes(conn)
#     dna_setAttributes(conn, attributes = att)
#   }, readRDS("../files/dna_getAttributes.RDS"))
# })

test_that("set Documents", {
  expect_equal({
    docs <- dna_getDocuments(conn)
    docs <- rbind(docs, docs)
    docs$id <- seq_along(docs$id)
    dna_setDocuments(
      conn, 
      documents = docs,
      simulate = TRUE, verbose = TRUE
    )
    dna_getDocuments(conn)
  }, readRDS("../files/dna_setDocuments.RDS"))
})

# saveRDS(dna_getDocuments(conn), "../files/dna_setDocuments.RDS")
