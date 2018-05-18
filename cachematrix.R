# makeCacheMatrix creates an object that caches its matrix inverse.
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


# cacheSolve computes matrix inverse from returned value of makeCacheMatrix function
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

