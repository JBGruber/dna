context("Data management")

conn <- dna_connection("sample.dna")

<<<<<<< HEAD
# Not working
# test_that("add Attribute", {
#   expect_output({
     dna_addAttribute(conn)
#   }, "A new attribute with ID2was added to the database.")
# })

# test_that("add Document",{
#   expect_output({
     dna_addDocument(conn, date = as.POSIXct("2018-12-02 19:32:19 GMT", tz = "GMT"))
#   }, "A new document with ID 8 was added to the database.")
# })

test_that("get Attributes", {
  expect_equal({
    dna_getAttributes(conn)
  }, readRDS("../files/dna_getAttributes.RDS"))
=======
test_that("add Attribute message", {
  expect_message({
     dna_addAttribute(conn)
  }, "A new attribute with ID 2 was added to the database.")
})

test_that("add Document message",{
  expect_message({
     dna_addDocument(conn, date = as.POSIXct("2018-12-02 19:32:19 GMT", tz = "GMT"))
  }, "A new document with ID 8 was added to the database")
})

test_that("get Attributes", {
  expect_that({
    dna_getAttributes(conn)
  }, equals(readRDS("../files/dna_getAttributes.RDS")))
>>>>>>> origin/master
})

# saveRDS(dna_getAttributes(conn), "../files/dna_getAttributes.RDS")

test_that("get Documents", {
<<<<<<< HEAD
  expect_equal({
    dna_getDocuments(conn)
  }, readRDS("../files/dna_getDocuments.RDS"))
=======
  expect_that({
    dna_getDocuments(conn)
  }, equals(readRDS("../files/dna_getDocuments.RDS")))
>>>>>>> origin/master
})

# saveRDS(dna_getDocuments(conn), "../files/dna_getDocuments.RDS")

test_that("remove Attribute", {
  expect_output({
<<<<<<< HEAD
   dna_removeAttribute(conn, attribute = 2)
  }, paste0("Simulation mode: no actual changes are made to the database!\n",
       "Statements removed: 0"))
})

# output produced by Java can't be captured
=======
   dna_removeAttribute(conn, attribute = 25)
  }, paste0("Simulation mode: no actual changes are made to the database!\n",
            "Statements removed: 0"))
})

>>>>>>> origin/master
test_that("remove Document",{
  expect_output({
    dna_removeDocument(conn, id = 8)
  }, paste0("Simulation mode: no actual changes are made to the database!\n",
            "Statements removed in Document 8: 0\n",                         
            "Removal of Document 8: successful."))
})

<<<<<<< HEAD
# Not working yet
# test_that("set Attributes", {
#   expect_equal({
#     att <- dna_getAttributes(conn)
#     att[nrow(att) + 1, ] <- c(26, "", "", "", "", "", 1)
#     att$id <- as.integer(att$id)
#     att$frequency <- as.integer(att$frequency)
#     dna_setAttributes(conn, attributes = att, simulate = FALSE)
#   }, readRDS("../files/dna_getAttributes.RDS"))
# })

test_that("set Documents", {
  expect_equal({
=======
test_that("set Attributes", {
  expect_that({
    att <- dna_getAttributes(conn)
    att[nrow(att) + 1, ] <- c(NA, "test", "#00CC00", "NGO", "", "", 1)
    att$id <- as.integer(att$id)
    att$frequency <- as.integer(att$frequency)
    dna_setAttributes(conn, attributes = att, simulate = FALSE)
    dna_getAttributes(conn)
  }, equals(readRDS("../files/dna_setAttributes.RDS")))
})

# saveRDS(dna_getAttributes(conn), "../files/dna_setAttributes.RDS")

test_that("set Documents", {
  expect_that({
>>>>>>> origin/master
    docs <- dna_getDocuments(conn)
    docs <- rbind(docs, docs)
    docs$id <- seq_along(docs$id)
    dna_setDocuments(
      conn, 
      documents = docs,
<<<<<<< HEAD
      simulate = TRUE, verbose = TRUE
    )
    dna_getDocuments(conn)
  }, readRDS("../files/dna_setDocuments.RDS"))
=======
      simulate = FALSE, verbose = TRUE
    )
    dna_getDocuments(conn)
  }, equals(readRDS("../files/dna_setDocuments.RDS")))
>>>>>>> origin/master
})

# saveRDS(dna_getDocuments(conn), "../files/dna_setDocuments.RDS")
