factors = (number) ->
	results = []

	if number == 1
		return [1]

	[1 .. Math.floor(Math.sqrt number)].map (x) ->
		if (number % x) == 0
			results.push x
	
	composites = results.map (x) ->
		number / x

	results.concat composites.reverse()

isPrime = (number) ->
	facts = factors number

	facts.length is 2 and facts[0] is 1 and facts[1] is number

primeFactors = (number) ->
	(factors number).filter (x) -> isPrime x

expect = (require "chai").expect

expect(factors(20)).to.be.deep.equal [1, 2, 4, 5, 10, 20]

(expect isPrime(2)).to.be.true
(expect isPrime(8)).to.be.false
(expect isPrime(57)).to.be.false
(expect isPrime(93)).to.be.false

(expect primeFactors(20)).to.be.deep.equal [2, 5]

console.log "What is the largest prime factor of the number 600851475143 => #{(primeFactors 600851475143).pop()}"