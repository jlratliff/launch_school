def factors(number)
  divisors = []
  possible_divisors = (1..number).to_a
  possible_divisors.each { |x| divisors << x if number % x == 0}
  divisors
end

p factors(0)
p factors(-5)
p factors(500)