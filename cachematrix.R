## A pair of functions that cache the inverse of a matrix.
## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  invmat <- NULL
  setmat <- function(y){
    x <<- y
    invmat <<- NULL
  }
  getmat <- function() x
  setInverse <- function(solveMatrix) invmat <<- solveMatrix
  getInverse <- function() invmat
  list(setmat = setmat, getmat = getmat, setInverse = setInverse, getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  invmat <- x$getInverse()
  if(!is.null(invmat)){
    message("getting cached data")
    return(invmat)
  }
  mat_data <- x$getmat()
  invmat <- solve(mat_data)
  x$setInverse(invmat)
  invmat      
}
