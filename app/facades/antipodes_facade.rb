class AntipodesFacade

  attr_reader :id, :location_name, :forecast, :search_location

  def initialize(location)
    @search_location = location
    @location_name = antipode_name
    @forecast = antipode_forecast
    @id = nil
  end

  def get_antipode
    location = get_location_forecast
    antipode = AntipodeService.get_antipode(location.lat, location.long)
  end

  def get_location_forecast
    location_forecast = ForecastsFacade.new(@search_location)
  end

  def antipode_lat
    get_antipode[:data][:attributes][:lat]
  end

  def antipode_long
    get_antipode[:data][:attributes][:long]
  end

  def antipode_name
    GoogleService.get_city_name(antipode_lat, antipode_long)
  end

  def antipode_forecast
    forecast = ForecastsFacade.new(antipode_name)
    {summary: forecast.summary, current_temp: forecast.current[:temp]}
  end
end
