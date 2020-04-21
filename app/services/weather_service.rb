class WeatherService

  def self.get_forecast(lat, lng)
    get_json("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial&appid=#{ENV['WEATHER_API_KEY']}")
  end

  private
    def self.get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new(url: "https://api.openweathermap.org")
    end
end
