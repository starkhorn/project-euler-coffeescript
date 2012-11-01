gcd = (x, y) ->
	if y is 0
		x
	else
		gcd y, x % y

lcm = (array) ->
	# lcm(x1,x2,...,xn) = lcm(lcm(xi, xi+1), xi+2) | i < n - 2
	iter = (accumulator, index) ->
		if index >= array.length
			accumulator
		else
			next = array[index]
			accumulator = accumulator * next / gcd(accumulator, next)

			iter accumulator, index + 1

	iter 1, 0

expect = require("chai").expect

expect(lcm [1 .. 10]).to.be.equal 2520

console.log "What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? => #{lcm [1 .. 20]}"