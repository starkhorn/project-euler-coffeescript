sum = (array) ->
	array.reduce ((x, y) -> x + y)

findMultiplesBelow = (limit, nums) ->
	[1 ... limit].filter (x) ->
		nums.some (num) -> (x % num) == 0

expect = (require 'chai').expect

expect(sum [1 .. 10]).to.equal 55
expect(findMultiplesBelow(10, [3, 5])).to.deep.equal [3, 5, 6, 9]
expect(sum findMultiplesBelow(10, [3, 5])).to.equal 23

console.log "Find the sum of all the multiples of 3 or 5 below 1000 => #{sum findMultiplesBelow 1000, [3, 5]}"