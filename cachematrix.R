## Put comments here that give an overall description of what your
## functions do

## Create null value m. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  ## Checking to see if there is cached data.
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  #Use qr.solve() to get inverse of the matrix.
  m <- qr.solve(data, ...)
  x$setinverse(m)
  m
}

