def factors(number)
  divisors = (1..number).to_a
  divisors.each { |x| divisors.delete(x) if number % x != 0}
  divisors
end

p factors(0)
p factors(-5)
p factors(500)