# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

rm(list = ls())

swirl_options(swirl_logging = TRUE) # allow logging for submission to Google Form

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

a <- read.table(file.path(.get_course_path(), "dsfl-swirl", "Significance testing", "data/a.data.txt"), header = TRUE, sep = "\t")
b <- read.table(file.path(.get_course_path(), "dsfl-swirl", "Significance testing", "data/b.data.txt"), header = TRUE, sep = "\t")
c <- read.table(file.path(.get_course_path(), "dsfl-swirl", "Significance testing", "data/c.data.txt"), header = TRUE, sep = "\t")


