class ForecastsFacade

  attr_reader :id, :location, :latitude, :longitude, :current, :hourly, :daily, :summary

  def initialize(location)
    coords = GoogleService.get_coordinates(location)
    @id = nil
    @location = coords[:results][0][:formatted_address]
    @latitude = coords[:results][0][:geometry][:location][:lat]
    @longitude = coords[:results][0][:geometry][:location][:lng]

    data = WeatherService.get_forecast(@latitude, @longitude)
    @current = data[:current]
    @hourly = data[:hourly]
    @daily = data[:daily]
    @summary = data[:current][:weather][0][:description]
  end
end
