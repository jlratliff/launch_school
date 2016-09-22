# e2q2.rb
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat", "nap", "work"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future
p RoadTrip.ancestors