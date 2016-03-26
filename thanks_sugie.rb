#thanks_sugie.rb

def thanks_sugie(reps)
  if reps == 0
    return
  else
    puts 'thanks_sugie'
    thanks_sugie(reps - 1)
  end
end

thanks_sugie(5)

