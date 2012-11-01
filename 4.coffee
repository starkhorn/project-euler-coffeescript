reverse = (str) ->
	result = ""

	result += str.charAt(i) for i in [str.length - 1 .. 0]
	result

isPalindrome = (number) ->
	number.toString() == reverse(number.toString())

productBelow = (number) ->
	result = []

	[1 ... number].forEach (x) ->
		[1 ... number].forEach (y) ->
			result.push x * y

	result

expect = (require "chai").expect

expect(reverse("hello")).to.be.equal "olleh"

expect(isPalindrome 9009).to.be.true
expect(isPalindrome 1500).to.be.false

expect(productBelow(100).filter((x) -> isPalindrome x).reduce((x, y) -> if x > y then x else y)).to.be.equal 9009

console.log "Find the largest palindrome made from the product of two 3-digit numbers. => #{productBelow(1000).filter((x) -> isPalindrome x).reduce((x, y) -> if x > y then x else y)}"