## Put comments here that give an overall description of what your
## functions do
## basically trying to make up the fact that I'm late for this course and get enough points to pass :/

## Write a short comment describing this function
# The first function, makeVector creates a special "vector", which is really a list containing a function to
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse
# get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function()
        x
    setinverse <- function(solve)
        m <<- inverse
    getinverse <- function()
        m
    list(
        set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## Write a short comment describing this function
# computes the inverse matrix, and read from the cache if the result already exists
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- inverse(data, ...)
    x$setinverse(m)
    m
}
