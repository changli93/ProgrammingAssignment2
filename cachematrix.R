## The following lexical scoping based functions are designed to create a special object that stores a matrix 
## and caches the matrix inverse.

## makeCacheMatrix function creates an object that caches its matrix inverse.
makeCacheMatrix <- function(x = matrix()) {
  # e.g. input parameter: x <- matrix(rnorm(9),3,3)
  
  # nothing is cached at the beginning, set null to inv_matrix variable
  inv_matrix <- NULL
  
  # set the stored matrix value
  setmat <- function(y){
    x <<- y
    inv_matrix <<- NULL
  }
  
  # return the stored matrix
  getmat <- function() x 
  
  # cache the given argument
  setInverse <- function(solveMatrix) inv_matrix <<- solveMatrix
  
  # return the cached value (matrix inverse)
  getInverse <- function() inv_matrix
  
  # each named element in the list indicates a function
  list(setmat = setmat, getmat = getmat, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve function computes matrix inverse from returned value of makeCacheMatrix function
## if matrix inverse has been computed before, it will return matrix inverse from cache
cacheSolve <- function(x, ...) {
  
  # get cached value of matrix inverse
  inv_matrix <- x$getInverse()
   
  # if the cached value is not null, return the cached value
  if(!is.null(inv_matrix)){
    message("getting cached data")
    return(inv_matrix)
  }
  
  # otherwise, take that matrix and caclulate its inverse, then cache it
  mat_data <- x$getmat()
  inv_matrix <- solve(mat_data)
  x$setInverse(inv_matrix)
  
  # return matrix inverse
  inv_matrix      
}

