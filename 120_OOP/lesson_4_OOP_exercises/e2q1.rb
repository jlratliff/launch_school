class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat", "nap", "work"]
  end
end

oracle = Oracle.new
p oracle.predict_the_future