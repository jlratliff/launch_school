def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "#{time_after - time_before} seconds"
end

time_it {100000000.times {}}