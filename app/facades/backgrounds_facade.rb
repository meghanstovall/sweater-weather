class BackgroundsFacade

  attr_reader :id, :url

  def initialize(location)
    @location = location
    @url = get_url[:results][0][:urls][:raw]
    @id = nil
  end

  def get_location_name
    GoogleService.get_coordinates(@location)[:results][0][:formatted_address]
  end

  def get_url
    BackgroundService.get_img_url(get_location_name)
  end
end
