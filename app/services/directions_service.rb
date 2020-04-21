class DirectionsService

  def self.get_road_trip(origin, destination, api_key)
    get_json("/maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=#{api_key}")
  end

  private
    def self.get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new(url: "https://maps.googleapis.com")
    end
end
