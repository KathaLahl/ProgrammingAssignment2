## This set of functions are to cache the inverse of a matrix and to
## check whether it's cached in order to avoid repetitive need for computing

## this will chache a certain matrix
## it returns a list of functions that can be used downstream

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x<<- y
    m <<- NULL
    
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set=set, get=get, setinverse=setinverse, 
       getinverse=getinverse)
  
}


## this will create the inverse of a matrix, but will first check whether it has already been done.
## the functions for setting and pulling the inverse matrix are written above and just called here


cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
