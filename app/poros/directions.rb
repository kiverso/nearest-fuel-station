class Directions
  attr_reader :distance, :travel_time, :instructions

  def initialize(attributes)
    @distance = attributes[:route][:distance]
    @travel_time = attributes[:route][:formattedTime]
    @instructions = attributes[:route][:legs][0][:maneuvers]
  end
end