class AntipodesFacade

  def initialize(location)
    # find lat and long for location
    # then hit antipode service with those lat and long
    # then use the lat and long returned from that to get that cities name
    # use that cities name to get the weather
    location_forecast = ForecastsFacade.new(location)
    antipode = AntipodeService.get_antipode(location_forecast.latitude, location_forecast.longitude)
    require "pry"; binding.pry
  end
end
