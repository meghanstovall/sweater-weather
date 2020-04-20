class ForecastsFacade

  attr_reader :id, :location, :current, :hourly, :daily

  def initialize(location)
    @search_location = location
    @id = nil

    coords = get_coordinates
    @location = coords[:results][0][:formatted_address]

    forecast = get_forecast
    @current = forecast[:current]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
  end

  def get_coordinates
    GoogleService.get_coordinates(@search_location)
  end

  def get_forecast
    WeatherService.get_forecast(get_latitde, get_longitude)
  end

  def get_latitde
    get_coordinates[:results][0][:geometry][:location][:lat]
  end

  def get_longitude
    get_coordinates[:results][0][:geometry][:location][:lng]
  end
end
