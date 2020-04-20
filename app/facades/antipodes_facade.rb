class AntipodesFacade

  attr_reader :id, :location_name, :forecast, :search_location

  def initialize(location)
    antipode_forecast = ForecastsFacade.new(get_antipode_name(location))

    @id = nil
    @location_name = get_antipode_name(location)
    @forecast = {summary: antipode_forecast.summary, current_temp:  antipode_forecast.current[:temp]}
    @search_location = location
  end

  def get_antipode_name(location)
    location_forecast = ForecastsFacade.new(location)

    antipode = AntipodeService.get_antipode(location_forecast.latitude, location_forecast.longitude)
    antipode_lat = antipode[:data][:attributes][:lat]
    antipode_long = antipode[:data][:attributes][:long]

    antipode_name = GoogleService.get_city_name(antipode_lat, antipode_long)[:results][0][:formatted_address]
  end
end
