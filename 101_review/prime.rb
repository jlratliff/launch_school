# prime.rb

def find_primes(start_num, end_num)
  if start_num < 2
    start_num = 2
  end
  (start_num..end_num).select { |num| isprime?(num) }
end

def isprime?(num)
  prime = true
  if num % 2 == 0
    prime = false unless num == 2
  else
    (3..Math.sqrt(num).to_i).each do |factor|
      if num % factor == 0
        prime = false
      end
    end
  end
  prime
end

p find_primes(0, 500)