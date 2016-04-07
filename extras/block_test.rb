# block_test.rb

def execute(&block)
  block.call
end

execute { puts "Hello from inside"}