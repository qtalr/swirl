
# ABOUT -------------------------------------------------------------------

rm(list = ls())

# Outline for lesson

getwd()
ls()
x <- 9
ls()
list.files()
?list.files
old.dir <- getwd()
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
list.files()
file.exists("mytest.R")
file.info("mytest.R")
file.rename("mytest.R", "mytest2.R")
file.copy("mytest2.R", "mytest3.R")
file.path("mytest3.R")
?dir.create
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)
unlink("testdir", recursive = TRUE)


