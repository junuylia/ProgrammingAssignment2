source("cachematrix.R")


#Singular Matrix
A = matrix(1:9,ncol=3)
cache = makeCacheMatrix(A)
cacheSolve(cache)

#Identity matrix
I = matrix(c(1,0,0,1),ncol=2)
cache = makeCacheMatrix(I)
cacheSolve(cache)

#Invertible matrix
B = matrix(c(1,5,3,2,1,3,6,2,4,5,-1,3,4,2,8,0),ncol=4)
cache = makeCacheMatrix(B)
cacheSolve(cache)

#Regular matrix
C = matrix(c(1,3,2,3,4,5),ncol=3)
cache = makeCacheMatrix(C)
cacheSolve(cache)