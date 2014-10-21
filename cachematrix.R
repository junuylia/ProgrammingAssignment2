## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  ## Return a "matrix" list, which is containing a function to
##   1. set the value of the matrix
##   2. get the value of the matrix
##   3. set the value of the inverse
##   4. get the value of the inverse
  #Initialize the inverse matrix
  inv = NULL
  
  #set and get the matrix
  set <- function (inputMat){
    x <<- inputMat
    inv <<- NULL
  }
  get <- function(){
    x
  }
  
  #set and get the inverse
  setInverse <- function (inverse){
    inv <<- inverse
  }
  getInverse <- function(){
    inv
  }
  
  #return the list
  list(set = set, get = get, 
       setInverse = setInverse, getInverse = getInverse)
}






## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  # first checks to see if the mean has already been calculated. 
  # If so, it gets the mean from the cache and skips the computation. 
  inv <- x$getInverse()
  if (!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, it calculates the mean of the data and 
  #sets the value of the mean in the cache via the setmean function.
  data <- x$get()
  tryCatch(inv <- solve(data,...), finally=x$setInverse(inv), 
           error = function(message) print("The matrix is not invertible"))
  
  inv
}
