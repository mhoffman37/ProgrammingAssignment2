# This function creates an empty argument (futinvmat) to cache the inverse, 
#Sets which the inverse of x is and assigns it to futinvmat

        makeCacheMatrix <- function(x = matrix()) {
                futinvmat <- NULL
                set <- function(y) {
                        x <<- y
                        futinvmat<<- NULL
                }
                get <- function() {x}
                setinverse <- function(solve) futinvmat <<- solve
                getinverse <- function() futinvmat
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
        }
        
        



#Tracks the inverse of the matrix saved in futinvmat after showing 
#a message that informs it is being getting from the cache



cacheSolve <- function(x, ...) {
        futinvmat <- x$getinverse()
           if(!is.null(futinvmat)) {
           message("getting cached data")
           return(futinvmat)
             }
           data <- x$get()
           futinvmat <- solve(data, ...)
           x$setinverse(futinvmat)
          futinvmat
        }