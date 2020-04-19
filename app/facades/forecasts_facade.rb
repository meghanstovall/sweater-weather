class ForecastsFacade

  attr_reader :id, :location, :latitude, :longitude

  def initialize(location)
    coords = GoogleService.get_coordinates(location)
    @id = nil
    @location = coords[:results][0][:formatted_address]
    @latitude = coords[:results][0][:geometry][:location][:lat]
    @longitude = coords[:results][0][:geometry][:location][:lng]
  end
end
