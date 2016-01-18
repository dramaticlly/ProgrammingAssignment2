## Put comments here that give an overall description of what your
## functions do


#is.matrix returns TRUE if x is a vector and has a "dim" attribute of length 2
# and FALSE otherwise

# func to get inverse of matrix m : solve(m)
# verify by m %*% solve(m) =  diag(nrow = nrow(m), ncol = ncol(m))

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y){
		x <- y
		inverse <- NULL
	}

	get <- function(){
		x
	}

	setinv <- function(inv){
		inverse <<-inv
	}

	getinv <- function(){
		inverse
	}

	list(set 	= set,
		 get 	= get,
		 setinv = setinv,
		 getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinv()
        # validare inverse is not NULL
        if(!is.null(inverse)){
        	message("getting cached data")
        	return(inverse)
        }
        # if inverse is NULL, compute
        data <- x$get()
        inverse <- solve(data,...)
        x$setinv(inverse)
        return(inverse)
}
