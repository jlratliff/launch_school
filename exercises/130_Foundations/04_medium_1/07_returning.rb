# 07_returning.rb

# For this exercise, we'll be learning and practicing our knowledge of returning from lambdas, procs, and implicit blocks. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# # Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# The proc call in line 8 executes the return, ending the method

# check_return_with_proc

# # Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# If the proc is defined outside of a method, it cannot return.

# # Group 3
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda

# A return within a lambda returns from the lambda and continues execution at the next command.

# # Group 4
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# Yielding to a block outside of a method that contains a return produces an error+