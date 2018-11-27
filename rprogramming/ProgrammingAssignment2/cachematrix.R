## makeCasheMatrix function creates a special "matrix" object that can cache its inverse.
## `cacheSolve` computes the inverse of the special "matrix" returned by `makeCacheMatrix`.
## If the inverse has already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache.

## Creates special maxtrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    setvector <- function(y) {x <<- y; i <<- NULL}
    getvector <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(setvector = setvector, getvector = getvector, 
         setinverse = setinverse, getinverse = getinverse) #names all the functions
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    matx <- x$getvector()
    i <- solve(matx, ...)
    x$setinverse(i)
    i
}