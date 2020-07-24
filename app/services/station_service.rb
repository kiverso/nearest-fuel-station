class StationService
  def nearest_station(address, limit)
    params = {fuel_type: 'ELEC', location: address, limit: limit }
    resp = conn.get('nearest.json', params)
    parsed = JSON.parse(resp.body, symbolize_names: true)
    parsed[:fuel_stations].first
  end

  private

  def conn
    Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |f|
      f.adapter Faraday.default_adapter
      f.params[:api_key] = ENV['NREL_API_KEY']
    end
  end
end