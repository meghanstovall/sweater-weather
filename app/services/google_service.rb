class GoogleService

  def self.get_coordinates(location)
    get_json("/maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")
  end

  def self.get_city_name(lat, long)
    get_json("/maps/api/geocode/json?latlng=#{lat},#{long}&key=#{ENV['GOOGLE_API_KEY']}")
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
