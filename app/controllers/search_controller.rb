class SearchController < ApplicationController
  def index
    station_service = StationService.new
    nearest_station = station_service.nearest_station(params[:location], 1)
    station = Station.new(nearest_station)
    map_service = MapService.new
    directions = map_service.get_directions(params[:location], station.address)
  end
end