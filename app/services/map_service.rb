class MapService

  def get_directions(start, finish)
    params = {from: start, to: finish }
    resp = conn.get('route', params)
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com/directions/v2/') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = ENV['MAPQUEST_API_KEY']
    end
  end
end