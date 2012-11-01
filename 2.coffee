sum = (array) ->
	array.reduce ((x, y) -> x + y)

fibonacci = (limit) ->
	iter = (old, current, array) ->
		next = old + current

		if next >= limit
			array
		else
			iter current, next, array.concat next

	iter 1, 2, [1, 2]

console.log "Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms => #{sum((fibonacci 4000000).filter (x) => (x % 2) == 0)}"