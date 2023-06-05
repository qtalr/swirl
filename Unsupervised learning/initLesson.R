swirl_options(swirl_logging = TRUE) # allow logging for submission to Google Form

library(fields)

# For compatibility with 2.2.21
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Put initialization code in this file.
path_to_course <- file.path(.get_course_path(),
	"dsfl-swirl","Unsupervised learning")
try(dev.off(),silent=TRUE)
plot.new()

pathtofile <- function(fileName){
  mypath <- file.path(.get_course_path(),
  	"dsfl-swirl","Unsupervised learning/",
                      fileName)
}
fxfer <- function(fileName){
  mypath <- pathtofile(fileName)
  file.copy(mypath,fileName)
}



myedit <- function(fname){
   #fxfer(fname)
   #file.edit(fname)
   mypath <- pathtofile(fname)
   file.edit(mypath)
}

# Hierarchical clustering
set.seed(1234);
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
dataFrame <- data.frame(x=x,y=y)
dataMatrix <- as.matrix(dataFrame)
distxy <- dist(dataFrame)
xsm <- c(x[4],x[8],x[11])
ysm <- c(y[4],y[8],y[11])
dFsm <- data.frame(x=xsm,y=ysm)
mt <- as.matrix(mtcars)
mt <- mt[22:32,1:6]
distmt <- dist(mt)
denmt <- as.dendrogram(hclust(distmt))

# K-means

mdist <- function(x,y,cx,cy){
   distTmp <- matrix(NA,nrow=3,ncol=12)
   distTmp[1,] <- (x-cx[1])^2 + (y-cy[1])^2
   distTmp[2,] <- (x-cx[2])^2 + (y-cy[2])^2
   distTmp[3,] <- (x-cx[3])^2 + (y-cy[3])^2  
   return(distTmp)
}

set.seed(1234);
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
dataFrame <- data.frame(x=x,y=y)
dataMatrix <- as.matrix(dataFrame)
distxy <- dist(dataFrame)
cx <- c(1,1.8,2.5)
cy <- c(2,1,1.5)
cmat <- matrix(c(cx,cy),nrow=2,byrow=TRUE) 

distTmp <- mdist(x,y,cx,cy)
newClust <- apply(distTmp,2,which.min)
cols1 <- c("red","orange","purple")
newCx <- tapply(x,newClust,mean)
newCy <- tapply(y,newClust,mean)
distTmp2 <- mdist(x,y,newCx,newCy)
newClust2 <- apply(distTmp2,2,which.min)
finalCx <- tapply(x,newClust2,mean)
finalCy <- tapply(y,newClust2,mean)
kmObj <- kmeans(dataFrame,3)
